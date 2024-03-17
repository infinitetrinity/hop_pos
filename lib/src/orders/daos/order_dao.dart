import 'package:drift/drift.dart';
import 'package:hop_pos/app/app_db.dart';
import 'package:hop_pos/app/app_extension.dart';
import 'package:hop_pos/src/customers/models/customer.dart';
import 'package:hop_pos/src/order_extras/models/new_order_extras_table.dart';
import 'package:hop_pos/src/order_extras/models/order_extra.dart';
import 'package:hop_pos/src/order_extras/models/order_extras_table.dart';
import 'package:hop_pos/src/order_items/models/new_order_items_table.dart';
import 'package:hop_pos/src/order_items/models/order_item.dart';
import 'package:hop_pos/src/order_items/models/order_items_table.dart';
import 'package:hop_pos/src/order_payments/models/new_order_payments_table.dart';
import 'package:hop_pos/src/order_payments/models/order_payment_with_method.dart';
import 'package:hop_pos/src/order_payments/models/order_payments_table.dart';
import 'package:hop_pos/src/orders/models/order.dart';
import 'package:hop_pos/src/orders/models/order_with_customer_and_payment.dart';
import 'package:hop_pos/src/orders/models/orders_table.dart';
import 'package:hop_pos/src/orders/models/pos_order.dart';
import 'package:hop_pos/src/screening_registrations/models/screening_registrations_table.dart';
import 'package:hop_pos/src/screening_timeslots/models/screening_timeslots_table.dart';
import 'package:hop_pos/src/screenings/models/screening.dart';
import 'package:hop_pos/src/screenings/models/screening_with_sales_data.dart';
import 'package:hop_pos/src/to_sync_data/models/to_sync_data.dart';

part 'order_dao.g.dart';

@DriftAccessor(tables: [
  OrdersTable,
  OrderItemsTable,
  OrderExtrasTable,
  OrderPaymentsTable,
  NewOrderItemsTable,
  NewOrderExtrasTable,
  NewOrderPaymentsTable,
  ScreeningTimeslotsTable,
  ScreeningRegistrationsTable,
])
class OrderDao extends DatabaseAccessor<AppDb> with _$OrderDaoMixin {
  OrderDao(AppDb db) : super(db);

  Future<Order> insertOrder(OrdersTableCompanion order) async {
    return await into(ordersTable).insertReturning(order);
  }

  Future<List<Order>> insertOrders(List<OrdersTableCompanion> orders) async {
    return await transaction(() async {
      List<Future<Order>> insertFutures = [];

      for (OrdersTableCompanion order in orders) {
        insertFutures.add(insertOrder(order));
      }

      List<Order> result = await Future.wait(insertFutures);
      return result;
    });
  }

  Future<PosOrder?> getPosOrder(Order order) async {
    final query = select(ordersTable).join(
      [
        leftOuterJoin(
          orderItemsTable,
          orderItemsTable.orderId.equalsExp(
            ordersTable.id,
          ),
        ),
        leftOuterJoin(
          orderExtrasTable,
          orderExtrasTable.orderId.equalsExp(
            ordersTable.id,
          ),
        ),
        leftOuterJoin(
          orderPaymentsTable,
          orderPaymentsTable.orderId.equalsExp(
            ordersTable.id,
          ),
        ),
        leftOuterJoin(
          newOrderItemsTable,
          newOrderItemsTable.orderId.equalsExp(
            ordersTable.id,
          ),
        ),
        leftOuterJoin(
          newOrderExtrasTable,
          newOrderExtrasTable.orderId.equalsExp(
            ordersTable.id,
          ),
        ),
        leftOuterJoin(
          newOrderPaymentsTable,
          newOrderPaymentsTable.orderId.equalsExp(
            ordersTable.id,
          ),
        ),
        leftOuterJoin(
          paymentMethodsTable,
          paymentMethodsTable.id.equalsExp(
                orderPaymentsTable.paymentMethodId,
              ) |
              paymentMethodsTable.id.equalsExp(
                newOrderPaymentsTable.paymentMethodId,
              ),
        ),
      ],
    );

    query.where(ordersTable.id.equals(order.id!));
    final result = await query.get();
    PosOrder posOrder = PosOrder(order: result.first.readTable(ordersTable));

    for (final row in result) {
      final item = row.readTableOrNull(orderItemsTable);
      if (item != null && posOrder.items?.contains(item) != true) {
        final items = List<OrderItem>.from(posOrder.items ?? []);
        items.add(item);
        posOrder = posOrder.copyWith(items: items);
      }

      final extra = row.readTableOrNull(orderExtrasTable);
      if (extra != null && posOrder.extras?.contains(extra) != true) {
        final extras = List<OrderExtra>.from(posOrder.extras ?? []);
        extras.add(extra);
        posOrder = posOrder.copyWith(extras: extras);
      }

      final payment = row.readTableOrNull(orderPaymentsTable)?.copyWith(isNew: true);
      final paymentMethod = row.readTableOrNull(paymentMethodsTable);
      final paymentWithMethod =
          payment != null ? OrderPaymentWithMethod(payment: payment, method: paymentMethod) : null;

      if (paymentWithMethod != null && posOrder.payments?.contains(paymentWithMethod) != true) {
        final payments = List<OrderPaymentWithMethod>.from(posOrder.payments ?? []);
        payments.add(paymentWithMethod);
        posOrder = posOrder.copyWith(payments: payments);
      }

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
    final latestOrder = await (select(ordersTable)
          ..where((tbl) => tbl.screeningId.equals(screening.id))
          ..where((tbl) => tbl.customerId.equals(customer.id!))
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
    final oCount = ordersTable.id.count();
    final oUtf = ordersTable.isUtf.cast<int>().sum();
    final oStf = ordersTable.isStf.cast<int>().sum();
    final oTotal = ordersTable.netTotal.total() + ordersTable.rounding.total();
    final oLastSalesAt = ordersTable.createdAt.max();

    final oPaymentQuery = selectOnly(orderPaymentsTable)
      ..addColumns([orderPaymentsTable.amount.total()])
      ..where(orderPaymentsTable.orderId.equalsExp(ordersTable.id));

    final oNewPaymentQuery = selectOnly(newOrderPaymentsTable)
      ..addColumns([newOrderPaymentsTable.amount.total()])
      ..where(
          newOrderPaymentsTable.orderId.equalsExp(ordersTable.id) & newOrderPaymentsTable.orderIsNew.isValue(false));

    final oTotalPayment =
        subqueryExpression<double>(oPaymentQuery).total() + subqueryExpression<double>(oNewPaymentQuery).total();

    final query = selectOnly(ordersTable)
      ..addColumns([
        ordersTable.screeningId,
        oCount,
        oUtf,
        oStf,
        oTotal,
        oTotalPayment,
        oLastSalesAt,
      ])
      ..where(ordersTable.screeningId.isIn(screeningIds))
      ..groupBy([ordersTable.screeningId]);

    return (await query.get()).map((row) {
      return ScreeningWithSalesData(
        screening: screenings.firstWhere((screening) => screening.id == row.read(ordersTable.screeningId)),
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
      customersTable.nric.substr(-5, 5),
    ]);

    final paymentQuery = selectOnly(orderPaymentsTable)
      ..addColumns([orderPaymentsTable.amount.total()])
      ..where(orderPaymentsTable.orderId.equalsExp(ordersTable.id));

    final newPaymentQuery = selectOnly(newOrderPaymentsTable)
      ..addColumns([newOrderPaymentsTable.amount.total()])
      ..where(
          newOrderPaymentsTable.orderId.equalsExp(ordersTable.id) & newOrderPaymentsTable.orderIsNew.isValue(false));

    final totalPayment = coalesce<double>([subqueryExpression(paymentQuery), const Constant(0)]) +
        coalesce<double>([subqueryExpression(newPaymentQuery), const Constant(0)]);

    final query = select(ordersTable).join(
      [
        innerJoin(
          customersTable,
          customersTable.id.equalsExp(
            ordersTable.customerId,
          ),
        ),
      ],
    )
      ..where(ordersTable.screeningId.equals(screening.id))
      ..orderBy([OrderingTerm.asc(index.cast<int>())]);

    query.addColumns([index, totalPayment]);

    if (!search.isNullOrEmpty) {
      query.where(ordersTable.invoiceNo.like("%$search%") |
          ordersTable.invoicePrefix.like("%$search%") |
          customersTable.fullName.like("%$search%") |
          customersTable.nric.like("%$search%"));
    }

    return (await query.get())
        .map(
          (row) => OrderWithCustomerAndPayment(
            screening: screening,
            order: row.readTable(ordersTable),
            customer: row.readTable(customersTable),
            index: row.read(index),
            totalPayment: row.read(totalPayment),
          ),
        )
        .toList();
  }

  Future<bool> updateOrder(Order order) async {
    return await transaction(() async {
      final count = await (update(ordersTable)..where((tbl) => tbl.id.equals(order.id!))).write(order.toData());

      await db.toSycnDataDao.insertToSyncData(order.toSyncData(ToSyncActions.update));
      return count > 0;
    });
  }

  Future<int> getLastInvoiceNo(String prefix) async {
    final row = await (select(ordersTable)
          ..where((tbl) => tbl.invoicePrefix.equals(prefix))
          ..orderBy([(tbl) => OrderingTerm.desc(tbl.invoiceNo.cast<int>())])
          ..limit(1))
        .getSingleOrNull();

    return int.tryParse(row?.invoiceNo ?? '') ?? 0;
  }

  Future<bool> deleteOrder(Order order) async {
    return await transaction(() async {
      await db.newOrderItemDao.deleteByOrder(order);
      await db.orderItemDao.deleteByOrder(order);
      await db.newOrderExtraDao.deleteByOrder(order);
      await db.orderExtraDao.deleteByOrder(order);
      await db.newOrderPaymentDao.deleteByOrder(order);
      await db.orderPaymentDao.deleteByOrder(order);

      final count = await (delete(ordersTable)..where((tbl) => tbl.id.equals(order.id!))).go();
      await db.toSycnDataDao.insertToSyncData(order.toSyncData(ToSyncActions.delete));
      return count > 0;
    });
  }

  Future<List<OrderWithCustomerAndPayment>> getIncompleteOrdersWithinDays(int days, {String? search}) async {
    final timeslotQuery = selectOnly(screeningTimeslotsTable)
      ..addColumns([screeningTimeslotsTable.id])
      ..where(screeningTimeslotsTable.screeningId.equalsExp(screeningsTable.id));

    final indexQuery = selectOnly(screeningRegistrationsTable)
      ..addColumns([screeningRegistrationsTable.index])
      ..where(screeningRegistrationsTable.customerId.equalsExp(customersTable.id) &
          screeningRegistrationsTable.timeslotId.isInQuery(timeslotQuery));

    final index = coalesce<String>([
      subqueryExpression(indexQuery),
      customersTable.nric.substr(-5, 5),
    ]);

    final paymentQuery = selectOnly(orderPaymentsTable)
      ..addColumns([orderPaymentsTable.amount.total()])
      ..where(orderPaymentsTable.orderId.equalsExp(ordersTable.id));

    final newPaymentQuery = selectOnly(newOrderPaymentsTable)
      ..addColumns([newOrderPaymentsTable.amount.total()])
      ..where(
          newOrderPaymentsTable.orderId.equalsExp(ordersTable.id) & newOrderPaymentsTable.orderIsNew.isValue(false));

    final totalPayment = coalesce<double>([subqueryExpression(paymentQuery), const Constant(0)]) +
        coalesce<double>([subqueryExpression(newPaymentQuery), const Constant(0)]);

    final isIncomplete = (ordersTable.netTotal + ordersTable.rounding - totalPayment).isBiggerThanValue(0.0001);

    final query = select(ordersTable).join(
      [
        innerJoin(
          customersTable,
          customersTable.id.equalsExp(
            ordersTable.customerId,
          ),
        ),
        innerJoin(
          screeningsTable,
          screeningsTable.id.equalsExp(
            ordersTable.screeningId,
          ),
        ),
      ],
    )
      ..where(ordersTable.createdAt.isBetweenValues(
        DateTime.now().subtract(Duration(days: days)),
        DateTime.now(),
      ))
      ..where(isIncomplete.isValue(true))
      ..orderBy([OrderingTerm.desc(ordersTable.createdAt)]);

    query.addColumns([index, totalPayment, isIncomplete]);

    if (!search.isNullOrEmpty) {
      query.where(ordersTable.invoiceNo.like("%$search%") |
          ordersTable.invoicePrefix.like("%$search%") |
          customersTable.fullName.like("%$search%") |
          customersTable.nric.like("%$search%"));
    }

    return (await query.get())
        .map(
          (row) => OrderWithCustomerAndPayment(
            screening: row.readTable(screeningsTable),
            order: row.readTable(ordersTable),
            customer: row.readTable(customersTable),
            index: row.read(index),
            totalPayment: row.read(totalPayment),
          ),
        )
        .toList();
  }

  Future<int> getIncompleteOrdersWithinDaysCount(int days, {String? search}) async {
    final paymentQuery = selectOnly(orderPaymentsTable)
      ..addColumns([orderPaymentsTable.amount.total()])
      ..where(orderPaymentsTable.orderId.equalsExp(ordersTable.id));

    final newPaymentQuery = selectOnly(newOrderPaymentsTable)
      ..addColumns([newOrderPaymentsTable.amount.total()])
      ..where(
          newOrderPaymentsTable.orderId.equalsExp(ordersTable.id) & newOrderPaymentsTable.orderIsNew.isValue(false));

    final totalPayment = coalesce<double>([subqueryExpression(paymentQuery), const Constant(0)]) +
        coalesce<double>([subqueryExpression(newPaymentQuery), const Constant(0)]);

    final isIncomplete = (ordersTable.netTotal + ordersTable.rounding - totalPayment).isBiggerThanValue(0.0001);

    final query = select(ordersTable).join(
      [
        innerJoin(
          customersTable,
          customersTable.id.equalsExp(
            ordersTable.customerId,
          ),
        ),
      ],
    )
      ..where(ordersTable.createdAt.isBetweenValues(
        DateTime.now().subtract(Duration(days: days)),
        DateTime.now(),
      ))
      ..where(isIncomplete.isValue(true));

    query.addColumns([totalPayment, isIncomplete]);

    if (!search.isNullOrEmpty) {
      query.where(ordersTable.invoiceNo.like("%$search%") |
          ordersTable.invoicePrefix.like("%$search%") |
          customersTable.fullName.like("%$search%") |
          customersTable.nric.like("%$search%"));
    }

    return (await query.get()).length;
  }

  Future<List<OrderWithCustomerAndPayment>> getCustomerOrders(Customer customer) async {
    final query = select(ordersTable).join(
      [
        innerJoin(
          customersTable,
          customersTable.id.equalsExp(
            ordersTable.customerId,
          ),
        ),
        innerJoin(
          screeningRegistrationsTable,
          screeningRegistrationsTable.customerId.equalsExp(
            customersTable.id,
          ),
        ),
        innerJoin(
          screeningsTable,
          screeningsTable.id.equalsExp(
            ordersTable.screeningId,
          ),
        ),
      ],
    )
      ..where(customersTable.id.equals(customer.id!))
      ..groupBy([ordersTable.id])
      ..orderBy([OrderingTerm.desc(ordersTable.createdAt)]);

    final index = coalesce<String>([
      screeningRegistrationsTable.index,
      customersTable.nric.substr(-5, 5),
    ]);

    final paymentQuery = selectOnly(orderPaymentsTable)
      ..addColumns([orderPaymentsTable.amount.total()])
      ..where(orderPaymentsTable.orderId.equalsExp(ordersTable.id));

    final newPaymentQuery = selectOnly(newOrderPaymentsTable)
      ..addColumns([newOrderPaymentsTable.amount.total()])
      ..where(
          newOrderPaymentsTable.orderId.equalsExp(ordersTable.id) & newOrderPaymentsTable.orderIsNew.isValue(false));

    final totalPayment = coalesce<double>([subqueryExpression(paymentQuery), const Constant(0)]) +
        coalesce<double>([subqueryExpression(newPaymentQuery), const Constant(0)]);

    query.addColumns([index, totalPayment]);

    return (await query.get())
        .map(
          (row) => OrderWithCustomerAndPayment(
            screening: row.readTable(screeningsTable),
            order: row.readTable(ordersTable),
            customer: row.readTable(customersTable),
            index: row.read(index),
            totalPayment: row.read(totalPayment),
          ),
        )
        .toList();
  }
}
