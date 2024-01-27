import 'package:drift/drift.dart';
import 'package:hop_pos/src/order_items/models/new_order_item.dart';
import 'package:hop_pos/src/orders/models/orders_table.dart';
import 'package:hop_pos/src/products/models/products_table.dart';

@UseRowClass(NewOrderItem)
class NewOrderItemsTable extends Table {
  @override
  String get tableName => 'new_order_items';
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(max: 255)();
  TextColumn get sku => text().withLength(max: 255)();
  TextColumn get description => text().nullable().withLength(max: 255)();
  RealColumn get price => real()();
  RealColumn get discount => real().nullable()();
  TextColumn get discountType => text().nullable().withLength(max: 255)();
  RealColumn get netPrice => real()();
  BoolColumn get isCustom => boolean()();
  BoolColumn get orderIsNew => boolean()();
  IntColumn get cartId => integer().nullable()();
  IntColumn get productId => integer().nullable().references(ProductsTable, #id, onDelete: KeyAction.setNull)();
  IntColumn get orderId => integer().references(OrdersTable, #id, onDelete: KeyAction.cascade)();
  DateTimeColumn get createdAt => dateTime()();
}
