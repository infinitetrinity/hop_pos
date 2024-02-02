import 'package:drift/drift.dart';
import 'package:hop_pos/app/app_db.dart';
import 'package:hop_pos/src/customers/models/customer.dart';
import 'package:hop_pos/src/order_extras/models/new_order_extras_table.dart';
import 'package:hop_pos/src/order_extras/models/order_extra.dart';
import 'package:hop_pos/src/order_extras/models/order_extras_table.dart';
import 'package:hop_pos/src/order_items/models/new_order_items_table.dart';
import 'package:hop_pos/src/order_items/models/order_item.dart';
import 'package:hop_pos/src/order_items/models/order_items_table.dart';
import 'package:hop_pos/src/order_payments/models/new_order_payments_table.dart';
import 'package:hop_pos/src/order_payments/models/order_payment.dart';
import 'package:hop_pos/src/order_payments/models/order_payments_table.dart';
import 'package:hop_pos/src/orders/models/order.dart';
import 'package:hop_pos/src/orders/models/orders_table.dart';
import 'package:hop_pos/src/orders/models/pos_order.dart';
import 'package:hop_pos/src/screenings/models/screening.dart';

part 'order_dao.g.dart';

@DriftAccessor(tables: [
  OrdersTable,
  OrderItemsTable,
  OrderExtrasTable,
  OrderPaymentsTable,
  NewOrderItemsTable,
  NewOrderExtrasTable,
  NewOrderPaymentsTable,
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
      ],
    );

    query.where(ordersTable.id.equals(latestOrder.id));
    final result = await query.get();
    PosOrder order = PosOrder(order: result.first.readTable(ordersTable));

    for (final row in result) {
      final item = row.readTableOrNull(orderItemsTable);
      if (item != null && order.items?.contains(item) != true) {
        final items = List<OrderItem>.from(order.items ?? []);
        items.add(item);
        order = order.copyWith(items: items);
      }

      final extra = row.readTableOrNull(orderExtrasTable);
      if (extra != null && order.extras?.contains(extra) != true) {
        final extras = List<OrderExtra>.from(order.extras ?? []);
        extras.add(extra);
        order = order.copyWith(extras: extras);
      }

      final payment = row.readTableOrNull(orderPaymentsTable);
      if (payment != null && order.payments?.contains(payment) != true) {
        final payments = List<OrderPayment>.from(order.payments ?? []);
        payments.add(payment);
        order = order.copyWith(payments: payments);
      }

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
      if (newPayment != null && order.payments?.contains(newPayment) != true) {
        final payments = List<OrderPayment>.from(order.payments ?? []);
        payments.add(newPayment);
        order = order.copyWith(payments: payments);
      }
    }

    return order;
  }
}
