import 'package:drift/drift.dart';
import 'package:hop_pos/app/app_db.dart';
import 'package:hop_pos/src/order_items/models/new_order_items_table.dart';
import 'package:hop_pos/src/order_items/models/order_item.dart';
import 'package:hop_pos/src/orders/models/order.dart';

part 'new_order_item_dao.g.dart';

@DriftAccessor(tables: [NewOrderItemsTable])
class NewOrderItemDao extends DatabaseAccessor<AppDb> with _$NewOrderItemDaoMixin {
  NewOrderItemDao(AppDb db) : super(db);

  Future<OrderItem> insertOrderItem(NewOrderItemsTableCompanion item) async {
    return await into(newOrderItemsTable).insertReturning(item);
  }

  Future<bool> deleteOrderItem(OrderItem item) async {
    final count = await (delete(newOrderItemsTable)..where((tbl) => tbl.id.equals(item.id!))).go();
    return count > 0;
  }

  Future<bool> updateOrderItem(OrderItem item) async {
    final count = await (update(newOrderItemsTable)..where((tbl) => tbl.id.equals(item.id!))).write(item.toData());
    return count > 0;
  }

  Future<bool> deleteByOrder(Order order) async {
    final count = await (delete(newOrderItemsTable)
          ..where((tbl) => tbl.orderId.equals(order.id!))
          ..where((tbl) => tbl.orderIsNew.equals(order.isNew)))
        .go();
    return count > 0;
  }

  Future<List<OrderItem>> getAll() {
    final query = select(newOrderItemsTable);

    query.orderBy([(table) => OrderingTerm.asc(table.id)]);
    return query.get();
  }

  Future<bool> deleteByIds(List<int> ids) async {
    final count = await (delete(newOrderItemsTable)..where((tbl) => tbl.id.isIn(ids))).go();
    return count > 0;
  }
}
