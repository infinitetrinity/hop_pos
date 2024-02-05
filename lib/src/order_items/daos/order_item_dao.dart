import 'package:drift/drift.dart';
import 'package:hop_pos/app/app_db.dart';
import 'package:hop_pos/src/order_items/models/order_item.dart';
import 'package:hop_pos/src/order_items/models/order_items_table.dart';

part 'order_item_dao.g.dart';

@DriftAccessor(tables: [OrderItemsTable])
class OrderItemDao extends DatabaseAccessor<AppDb> with _$OrderItemDaoMixin {
  OrderItemDao(AppDb db) : super(db);

  Future<OrderItem> insertOrderItem(OrderItemsTableCompanion item) async {
    return await into(orderItemsTable).insertReturning(item);
  }

  Future<List<OrderItem>> insertOrderItems(List<OrderItemsTableCompanion> items) async {
    return await transaction(() async {
      List<Future<OrderItem>> insertFutures = [];

      for (OrderItemsTableCompanion item in items) {
        insertFutures.add(insertOrderItem(item));
      }

      List<OrderItem> result = await Future.wait(insertFutures);
      return result;
    });
  }

  Future<bool> deleteOrderItem(OrderItem item, Expression<bool> where) async {
    final count = await (db.delete(orderItemsTable)..where((_) => where)).go();
    return count > 0;
  }
}
