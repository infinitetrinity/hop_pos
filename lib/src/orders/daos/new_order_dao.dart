import 'package:drift/drift.dart';
import 'package:hop_pos/app/app_db.dart';
import 'package:hop_pos/app/app_extension.dart';
import 'package:hop_pos/src/customers/models/customer.dart';
import 'package:hop_pos/src/customers/models/customers_table.dart';
import 'package:hop_pos/src/customers/models/new_customers_table.dart';
import 'package:hop_pos/src/order_extras/models/new_order_extras_table.dart';
import 'package:hop_pos/src/order_extras/models/order_extra.dart';
import 'package:hop_pos/src/order_items/models/new_order_items_table.dart';
import 'package:hop_pos/src/order_items/models/order_item.dart';
import 'package:hop_pos/src/order_payments/models/new_order_payments_table.dart';
import 'package:hop_pos/src/order_payments/models/order_payment_with_method.dart';
import 'package:hop_pos/src/orders/models/new_orders_table.dart';
import 'package:hop_pos/src/orders/models/order.dart';
import 'package:hop_pos/src/orders/models/order_with_customer_and_payment.dart';
import 'package:hop_pos/src/orders/models/pos_order.dart';
import 'package:hop_pos/src/screening_registrations/models/screening_registrations_table.dart';
import 'package:hop_pos/src/screening_timeslots/models/screening_timeslots_table.dart';
import 'package:hop_pos/src/screenings/models/screening.dart';
import 'package:hop_pos/src/screenings/models/screening_with_sales_data.dart';

part 'new_order_dao.g.dart';

@DriftAccessor(tables: [
  NewOrdersTable,
  NewOrderItemsTable,
  NewOrderExtrasTable,
  NewOrderPaymentsTable,
  CustomersTable,
  NewCustomersTable,
  ScreeningTimeslotsTable,
  ScreeningRegistrationsTable,
])
class NewOrderDao extends DatabaseAccessor<AppDb> with _$NewOrderDaoMixin {
  NewOrderDao(AppDb db) : super(db);

  Expression<String> _getIndexExpression({Screening? screening}) {
    final timeslotQuery = selectOnly(screeningTimeslotsTable)..addColumns([screeningTimeslotsTable.id]);

    screening == null
        ? timeslotQuery.where(screeningTimeslotsTable.screeningId.equalsExp(screeningsTable.id))
        : timeslotQuery.where(screeningTimeslotsTable.screeningId.equals(screening.id));

    final indexQuery = selectOnly(screeningRegistrationsTable)
      ..addColumns([screeningRegistrationsTable.index])
      ..where(screeningRegistrationsTable.customerId.equalsExp(customersTable.id) &
          screeningRegistrationsTable.timeslotId.isInQuery(timeslotQuery));

    return coalesce<String>([
      subqueryExpression(indexQuery),
      newCustomersTable.nric.substr(-5, 5),
      customersTable.nric.substr(-5, 5),
    ]);
  }

  Expression<double> _getTotalPaymentExpression() {
    final paymentQuery = selectOnly(newOrderPaymentsTable)
      ..addColumns([newOrderPaymentsTable.amount.total()])
      ..where(
          newOrderPaymentsTable.orderId.equalsExp(newOrdersTable.id) & newOrderPaymentsTable.orderIsNew.isValue(true));

    return coalesce<double>([subqueryExpression(paymentQuery), const Constant(0)]);
  }

  Customer _getCustomerFromTypedResult(TypedResult row) {
    return row.readTableOrNull(customersTable) == null
        ? row.readTable(newCustomersTable).copyWith(isNew: true)
        : row.readTable(customersTable);
  }

  Future<PosOrder?> getPosOrder(Order order) async {
    final query = select(newOrdersTable).join(
      [
        leftOuterJoin(
          newOrderItemsTable,
          newOrderItemsTable.orderId.equalsExp(
            newOrdersTable.id,
          ),
        ),
        leftOuterJoin(
          newOrderExtrasTable,
          newOrderExtrasTable.orderId.equalsExp(
            newOrdersTable.id,
          ),
        ),
        leftOuterJoin(
          newOrderPaymentsTable,
          newOrderPaymentsTable.orderId.equalsExp(
            newOrdersTable.id,
          ),
        ),
        leftOuterJoin(
          paymentMethodsTable,
          paymentMethodsTable.id.equalsExp(
            newOrderPaymentsTable.paymentMethodId,
          ),
        ),
      ],
    );

    query.where(newOrdersTable.id.equals(order.id!));
    final result = await query.get();
    PosOrder posOrder = PosOrder(order: result.first.readTable(newOrdersTable).copyWith(isNew: true));

    for (final row in result) {
      final newItem = row.readTableOrNull(newOrderItemsTable)?.copyWith(isNew: true);
      if (newItem != null && posOrder.items?.contains(newItem) != true) {
        final items = List<OrderItem>.from(posOrder.items ?? []);
        items.add(newItem);
        posOrder = posOrder.copyWith(items: items);
      }

      final newExtra = row.readTableOrNull(newOrderExtrasTable)?.copyWith(isNew: true);
      if (newExtra != null && posOrder.extras?.contains(newExtra) != true) {
        final extras = List<OrderExtra>.from(posOrder.extras ?? []);
        extras.add(newExtra);
        posOrder = posOrder.copyWith(extras: extras);
      }

      final newPayment = row.readTableOrNull(newOrderPaymentsTable)?.copyWith(isNew: true);
      final newPaymentMethod = row.readTableOrNull(paymentMethodsTable);
      final newPaymentWithMethod =
          newPayment != null ? OrderPaymentWithMethod(payment: newPayment, method: newPaymentMethod) : null;

      if (newPaymentWithMethod != null && posOrder.payments?.contains(newPaymentWithMethod) != true) {
        final payments = List<OrderPaymentWithMethod>.from(posOrder.payments ?? []);
        payments.add(newPaymentWithMethod);
        posOrder = posOrder.copyWith(payments: payments);
      }
    }

    return posOrder.copyWith(
      items: List<OrderItem>.from(posOrder.items ?? [])..sort((a, b) => (a.cartId ?? 0).compareTo(b.cartId ?? 0)),
    );
  }

  Future<PosOrder?> getScreeningCustomerLatestOrder(Screening screening, Customer customer) async {
    final latestOrder = await (select(newOrdersTable)
          ..where((tbl) => tbl.screeningId.equals(screening.id))
          ..where((tbl) => tbl.customerNric.equals(customer.nric!))
          ..orderBy([(tbl) => OrderingTerm.desc(tbl.createdAt)])
          ..limit(1))
        .getSingleOrNull();

    if (latestOrder == null) {
      return null;
    }

    return await getPosOrder(latestOrder);
  }

  Future<List<ScreeningWithSalesData>> getScreeningOrdersData(List<Screening> screenings) async {
    final screeningIds = screenings.map((screening) => screening.id);
    final oCount = newOrdersTable.id.count();
    final oUtf = newOrdersTable.isUtf.cast<int>().sum();
    final oStf = newOrdersTable.isStf.cast<int>().sum();
    final oTotal = newOrdersTable.netTotal.total() + newOrdersTable.rounding.total();
    final oLastSalesAt = newOrdersTable.createdAt.max();
    final oTotalPayment = _getTotalPaymentExpression().total();

    final query = selectOnly(newOrdersTable)
      ..addColumns([
        newOrdersTable.screeningId,
        oCount,
        oUtf,
        oStf,
        oTotal,
        oTotalPayment,
        oLastSalesAt,
      ])
      ..where(newOrdersTable.screeningId.isIn(screeningIds))
      ..groupBy([newOrdersTable.screeningId]);

    return (await query.get()).map((row) {
      return ScreeningWithSalesData(
        screening: screenings.firstWhere((screening) => screening.id == row.read(newOrdersTable.screeningId)),
        salesCount: row.read(oCount) ?? 0,
        salesTotal: row.read(oTotal) ?? 0,
        paymentTotal: row.read(oTotalPayment) ?? 0,
        stfCount: row.read(oStf) ?? 0,
        utfCount: row.read(oUtf) ?? 0,
        lastSalesAt: row.read(oLastSalesAt)!,
      );
    }).toList();
  }

  Future<List<OrderWithCustomerAndPayment>> getScreeningOrders(Screening screening, {String? search}) async {
    final index = _getIndexExpression(screening: screening);
    final totalPayment = _getTotalPaymentExpression();

    final query = select(newOrdersTable).join(
      [
        leftOuterJoin(
          customersTable,
          customersTable.nric.equalsExp(
            newOrdersTable.customerNric,
          ),
        ),
        leftOuterJoin(
          newCustomersTable,
          newCustomersTable.nric.equalsExp(
            newOrdersTable.customerNric,
          ),
        ),
      ],
    )
      ..where(newOrdersTable.screeningId.equals(screening.id))
      ..orderBy([OrderingTerm.asc(index.cast<int>())]);

    query.addColumns([index, totalPayment]);

    if (!search.isNullOrEmpty) {
      query.where(newOrdersTable.invoiceNo.like("%$search%") |
          newOrdersTable.invoicePrefix.like("%$search%") |
          customersTable.fullName.like("%$search%") |
          customersTable.nric.like("%$search%") |
          newCustomersTable.fullName.like("%$search%") |
          newCustomersTable.nric.like("%$search%"));
    }

    return (await query.get()).map((row) {
      return OrderWithCustomerAndPayment(
        screening: screening,
        order: row.readTable(newOrdersTable).copyWith(isNew: true),
        customer: _getCustomerFromTypedResult(row),
        index: row.read(index),
        totalPayment: row.read(totalPayment),
      );
    }).toList();
  }

  Future<bool> updateOrder(Order order) async {
    final count = await (update(newOrdersTable)..where((tbl) => tbl.id.equals(order.id!))).write(order.toData());
    return count > 0;
  }

  Future<int> getLastInvoiceNo() async {
    final row = await (select(newOrdersTable)
          ..orderBy([(tbl) => OrderingTerm.desc(tbl.invoiceNo.cast<int>())])
          ..limit(1))
        .getSingleOrNull();

    return int.tryParse(row?.invoiceNo ?? '') ?? 0;
  }

  Future<PosOrder> storeWithItemsAndExtras(PosOrder order) async {
    return await transaction(() async {
      final newOrder = await into(newOrdersTable).insertReturning(order.order.toData());

      for (OrderItem item in order.items ?? []) {
        await db.newOrderItemDao.insertOrderItem(item
            .copyWith(
              orderId: newOrder.id!,
              orderIsNew: true,
            )
            .toData());
      }

      for (OrderExtra extra in order.extras ?? []) {
        await db.newOrderExtraDao.insertOrderExtra(extra
            .copyWith(
              orderId: newOrder.id!,
              orderIsNew: true,
            )
            .toData());
      }

      return order.copyWith(order: newOrder.copyWith(isNew: true));
    });
  }

  Future<bool> deleteOrder(Order order) async {
    return await transaction(() async {
      await db.newOrderItemDao.deleteByOrder(order);
      await db.newOrderExtraDao.deleteByOrder(order);
      await db.newOrderPaymentDao.deleteByOrder(order);

      final count = await (delete(newOrdersTable)..where((tbl) => tbl.id.equals(order.id!))).go();
      return count > 0;
    });
  }

  Future<List<OrderWithCustomerAndPayment>> getIncompleteOrdersWithinDays(int days, {String? search}) async {
    final index = _getIndexExpression();
    final totalPayment = _getTotalPaymentExpression();
    final isIncomplete = (newOrdersTable.netTotal + newOrdersTable.rounding - totalPayment).isBiggerThanValue(0.0001);

    final query = select(newOrdersTable).join(
      [
        innerJoin(
          screeningsTable,
          screeningsTable.id.equalsExp(
            newOrdersTable.screeningId,
          ),
        ),
        leftOuterJoin(
          customersTable,
          customersTable.nric.equalsExp(
            newOrdersTable.customerNric,
          ),
        ),
        leftOuterJoin(
          newCustomersTable,
          newCustomersTable.nric.equalsExp(
            newOrdersTable.customerNric,
          ),
        ),
      ],
    )
      ..where(newOrdersTable.createdAt.isBetweenValues(
        DateTime.now().subtract(Duration(days: days)),
        DateTime.now(),
      ))
      ..where(isIncomplete.isValue(true))
      ..orderBy([OrderingTerm.desc(newOrdersTable.createdAt)]);

    query.addColumns([index, totalPayment, isIncomplete]);

    if (!search.isNullOrEmpty) {
      query.where(newOrdersTable.invoiceNo.like("%$search%") |
          newOrdersTable.invoicePrefix.like("%$search%") |
          newCustomersTable.fullName.like("%$search%") |
          newCustomersTable.nric.like("%$search%") |
          customersTable.fullName.like("%$search%") |
          customersTable.nric.like("%$search%"));
    }

    return (await query.get()).map((row) {
      return OrderWithCustomerAndPayment(
        screening: row.readTable(screeningsTable),
        order: row.readTable(newOrdersTable).copyWith(isNew: true),
        customer: _getCustomerFromTypedResult(row),
        index: row.read(index),
        totalPayment: row.read(totalPayment),
      );
    }).toList();
  }

  Future<List<OrderWithCustomerAndPayment>> getCustomerOrders(Customer customer) async {
    final query = select(newOrdersTable).join(
      [
        innerJoin(
          screeningsTable,
          screeningsTable.id.equalsExp(
            newOrdersTable.screeningId,
          ),
        ),
        leftOuterJoin(
          customersTable,
          customersTable.nric.equalsExp(
            newOrdersTable.customerNric,
          ),
        ),
        leftOuterJoin(
          newCustomersTable,
          newCustomersTable.nric.equalsExp(
            newOrdersTable.customerNric,
          ),
        ),
      ],
    )
      ..groupBy([newOrdersTable.id])
      ..orderBy([OrderingTerm.desc(newOrdersTable.createdAt)]);

    customer.isNew
        ? query.where(newCustomersTable.nric.equals(customer.nric!))
        : query.where(customersTable.id.equals(customer.id!));

    final index = _getIndexExpression();
    final totalPayment = _getTotalPaymentExpression();
    query.addColumns([index, totalPayment]);

    return (await query.get()).map((row) {
      return OrderWithCustomerAndPayment(
        screening: row.readTable(screeningsTable),
        order: row.readTable(newOrdersTable).copyWith(isNew: true),
        customer: _getCustomerFromTypedResult(row),
        index: row.read(index),
        totalPayment: row.read(totalPayment),
      );
    }).toList();
  }

  Future<List<Order>> getAll() {
    final query = select(newOrdersTable);

    query.orderBy([(table) => OrderingTerm.asc(table.id)]);
    return query.get();
  }

  Future<bool> deleteByIds(List<int> ids) async {
    final count = await (delete(newOrdersTable)..where((tbl) => tbl.id.isIn(ids))).go();
    return count > 0;
  }
}
