import 'package:drift/drift.dart';
import 'package:hop_pos/app/app_db.dart';
import 'package:hop_pos/src/orders/models/order.dart';
import 'package:hop_pos/src/orders/models/orders_table.dart';

part 'order_dao.g.dart';

@DriftAccessor(tables: [OrdersTable])
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

  Future<bool> updateOrder(
      OrdersTableCompanion order, Expression<bool> where) async {
    final count = await (update(ordersTable)..where((_) => where)).write(order);
    return count > 0;
  }
}
