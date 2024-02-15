import 'package:drift/drift.dart';
import 'package:hop_pos/app/app_db.dart';
import 'package:hop_pos/src/order_items/models/order_item.dart';
import 'package:hop_pos/src/order_items/models/order_items_table.dart';
import 'package:hop_pos/src/orders/models/order.dart';
import 'package:hop_pos/src/to_sync_data/models/to_sync_data.dart';

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

  Future<bool> deleteOrderItem(OrderItem item) async {
    return await transaction(() async {
      final count = await (delete(orderItemsTable)..where((tbl) => tbl.id.equals(item.id!))).go();

      await db.toSycnDataDao.insertToSyncData(item.toSyncData(ToSyncActions.delete));
      return count > 0;
    });
  }

  Future<bool> updateOrderItem(OrderItem item) async {
    return await transaction(() async {
      final count = await (update(orderItemsTable)..where((tbl) => tbl.id.equals(item.id!))).write(item.toData());

      await db.toSycnDataDao.insertToSyncData(item.toSyncData(ToSyncActions.update));
      return count > 0;
    });
  }

  Future<void> deleteByOrder(Order order) async {
    return await transaction(() async {
      final items = await (select(orderItemsTable)..where((tbl) => tbl.orderId.equals(order.id!))).get();
      List<Future<bool>> deleteFutures = [];

      for (OrderItem item in items) {
        deleteFutures.add(deleteOrderItem(item));
      }

      await Future.wait(deleteFutures);
    });
  }
}
