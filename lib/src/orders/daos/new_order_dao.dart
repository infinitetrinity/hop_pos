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
import 'package:hop_pos/src/pos/models/pos_cart.dart';
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

    query.where(newOrdersTable.id.equals(latestOrder.id!));
    final result = await query.get();
    PosOrder order = PosOrder(order: result.first.readTable(newOrdersTable).copyWith(isNew: true));

    for (final row in result) {
      final newItem = row.readTableOrNull(newOrderItemsTable)?.copyWith(isNew: true);
      if (newItem != null && order.items?.contains(newItem) != true) {
        final items = List<OrderItem>.from(order.items ?? []);
        items.add(newItem);
        order = order.copyWith(items: items);
      }

      final newExtra = row.readTableOrNull(newOrderExtrasTable)?.copyWith(isNew: true);
      if (newExtra != null && order.extras?.contains(newExtra) != true) {
        final extras = List<OrderExtra>.from(order.extras ?? []);
        extras.add(newExtra);
        order = order.copyWith(extras: extras);
      }

      final newPayment = row.readTableOrNull(newOrderPaymentsTable)?.copyWith(isNew: true);
      final newPaymentMethod = row.readTableOrNull(paymentMethodsTable);
      final newPaymentWithMethod =
          newPayment != null ? OrderPaymentWithMethod(payment: newPayment, method: newPaymentMethod) : null;

      if (newPaymentWithMethod != null && order.payments?.contains(newPaymentWithMethod) != true) {
        final payments = List<OrderPaymentWithMethod>.from(order.payments ?? []);
        payments.add(newPaymentWithMethod);
        order = order.copyWith(payments: payments);
      }
    }

    return order.copyWith(
      items: List<OrderItem>.from(order.items ?? [])..sort((a, b) => (a.cartId ?? 0).compareTo(b.cartId ?? 0)),
    );
  }

  Future<List<PosCart>> getScreeningNewOrders(Screening screening) async {
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
    )..where(newOrdersTable.screeningId.equals(screening.id));

    return (await query.get())
        .map((row) => PosCart(
              customer: row.readTableOrNull(newCustomersTable) ?? row.readTableOrNull(customersTable),
              order: PosOrder(order: row.readTable(newOrdersTable)),
            ))
        .toList();
  }

  Future<List<ScreeningWithSalesData>> getScreeningOrdersData(List<Screening> screenings) async {
    final screeningIds = screenings.map((screening) => screening.id);
    final oCount = newOrdersTable.id.count();
    final oUtf = newOrdersTable.isUtf.cast<int>().sum();
    final oStf = newOrdersTable.isStf.cast<int>().sum();
    final oTotal = newOrdersTable.netTotal.total() + newOrdersTable.rounding.total();
    final oLastSalesAt = newOrdersTable.createdAt.max();

    final oNewPaymentQuery = selectOnly(newOrderPaymentsTable)
      ..addColumns([newOrderPaymentsTable.amount.total()])
      ..where(
          newOrderPaymentsTable.orderId.equalsExp(newOrdersTable.id) & newOrderPaymentsTable.orderIsNew.isValue(true));

    final oTotalPayment = subqueryExpression<double>(oNewPaymentQuery).total();

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
    final timeslotQuery = selectOnly(screeningTimeslotsTable)
      ..addColumns([screeningTimeslotsTable.id])
      ..where(screeningTimeslotsTable.screeningId.equals(screening.id));

    final indexQuery = selectOnly(screeningRegistrationsTable)
      ..addColumns([screeningRegistrationsTable.index])
      ..where(screeningRegistrationsTable.customerId.equalsExp(customersTable.id) &
          screeningRegistrationsTable.timeslotId.isInQuery(timeslotQuery));

    final index = coalesce<String>([
      subqueryExpression(indexQuery),
      newCustomersTable.nric.substr(-5, 5),
      customersTable.nric.substr(-5, 5),
    ]);

    final paymentQuery = selectOnly(newOrderPaymentsTable)
      ..addColumns([newOrderPaymentsTable.amount])
      ..where(
          newOrderPaymentsTable.orderId.equalsExp(newOrdersTable.id) & newOrderPaymentsTable.orderIsNew.isValue(true));

    final totalPayment = coalesce<double>([subqueryExpression(paymentQuery), const Constant(0)]);

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
          customersTable.nric.like("%$search%"));
    }

    return (await query.get()).map((row) {
      final customer =
          row.readTableOrNull(customersTable) ?? row.readTableOrNull(newCustomersTable)?.copyWith(isNew: true);

      return OrderWithCustomerAndPayment(
        order: row.readTable(newOrdersTable).copyWith(isNew: true),
        customer: customer!,
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
}
