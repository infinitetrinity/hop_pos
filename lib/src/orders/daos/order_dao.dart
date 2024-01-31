import 'package:drift/drift.dart';
import 'package:hop_pos/app/app_db.dart';
import 'package:hop_pos/src/customers/models/customer.dart';
import 'package:hop_pos/src/order_extras/models/order_extras_table.dart';
import 'package:hop_pos/src/order_items/models/order_items_table.dart';
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

  Future<List<PosOrder>?> getScreeningCustomerOrders(Screening screening, Customer customer) async {
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
      ],
    );

    print('customer ${customer.id}');
    print('screening ${screening.id}');

    query.where(ordersTable.screeningId.equals(screening.id));
    query.where(ordersTable.customerId.equals(customer.id!));
    query.orderBy([OrderingTerm.desc(ordersTable.createdAt)]);

    final ordersMap = <int, PosOrder>{};
    final result = await query.get();

    for (final row in result) {
      final orderId = row.readTable(ordersTable).id;
      PosOrder order = ordersMap[orderId] ??= PosOrder(order: row.readTable(ordersTable));

      final item = row.readTableOrNull(orderItemsTable);
      if (item != null && order.items?.contains(item) != true) {
        final items = order.items ?? [];
        items.add(item);
        order = order.copyWith(items: items);
      }

      final payment = row.readTableOrNull(orderPaymentsTable);
      if (payment != null && order.payments?.contains(payment) != true) {
        final payments = order.payments ?? [];
        payments.add(payment);
        order = order.copyWith(payments: payments);
      }
    }

    return ordersMap.values.toList();
  }
}
