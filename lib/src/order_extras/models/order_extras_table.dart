import 'package:drift/drift.dart';
import 'package:hop_pos/src/order_extras/models/order_extra.dart';
import 'package:hop_pos/src/orders/models/orders_table.dart';
import 'package:hop_pos/src/pos_extras/models/pos_extras_table.dart';

@UseRowClass(OrderExtra)
class OrderExtrasTable extends Table {
  @override
  String get tableName => 'order_extras';
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(max: 255)();
  TextColumn get type => text().withLength(max: 255)();
  TextColumn get description => text().nullable().withLength(max: 255)();
  RealColumn get amount => real()();
  TextColumn get amountType => text().withLength(max: 255)();
  RealColumn get calculatedAmount => real()();
  IntColumn get extraId => integer().nullable().references(PosExtrasTable, #id, onDelete: KeyAction.setNull)();
  IntColumn get orderId => integer().references(OrdersTable, #id, onDelete: KeyAction.cascade)();
}