import 'package:drift/drift.dart';
import 'package:hop_pos/app/app_db.dart';
import 'package:hop_pos/src/order_items/models/new_order_items_table.dart';
import 'package:hop_pos/src/order_items/models/order_item.dart';

part 'new_order_item_dao.g.dart';

@DriftAccessor(tables: [NewOrderItemsTable])
class NewOrderItemDao extends DatabaseAccessor<AppDb> with _$NewOrderItemDaoMixin {
  NewOrderItemDao(AppDb db) : super(db);

  Future<OrderItem> insertOrderItem(NewOrderItemsTableCompanion item) async {
    return await into(newOrderItemsTable).insertReturning(item);
  }

  Future<bool> deleteOrderItem(OrderItem item, Expression<bool> where) async {
    final count = await (db.delete(newOrderItemsTable)..where((_) => where)).go();
    return count > 0;
  }

  Future<bool> updateOrderItem(NewOrderItemsTableCompanion item, Expression<bool> where) async {
    final count = await (update(newOrderItemsTable)..where((_) => where)).write(item);
    return count > 0;
  }
}
