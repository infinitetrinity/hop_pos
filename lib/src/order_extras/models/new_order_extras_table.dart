import 'package:drift/drift.dart';
import 'package:hop_pos/src/order_extras/models/order_extra.dart';
import 'package:hop_pos/src/orders/models/orders_table.dart';
import 'package:hop_pos/src/pos_extras/models/pos_extra.dart';
import 'package:hop_pos/src/pos_extras/models/pos_extras_table.dart';

@TableIndex(name: 'new_order_extras_id', columns: {#id}, unique: true)
@TableIndex(name: 'new_order_extras_extra_id', columns: {#extraId})
@TableIndex(name: 'new_order_extras_order_id', columns: {#orderId})
@UseRowClass(OrderExtra)
class NewOrderExtrasTable extends Table {
  @override
  String get tableName => 'new_order_extras';
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(max: 255)();
  TextColumn get type => textEnum<ExtraType>()();
  TextColumn get description => text().nullable().withLength(max: 255)();
  RealColumn get amount => real()();
  TextColumn get amountType => textEnum<ExtraAmountType>()();
  RealColumn get calculatedAmount => real()();
  IntColumn get extraId => integer().nullable().references(PosExtrasTable, #id, onDelete: KeyAction.setNull)();
  IntColumn get orderId => integer().references(OrdersTable, #id, onDelete: KeyAction.cascade)();
  BoolColumn get orderIsNew => boolean()();
  DateTimeColumn get createdAt => dateTime()();
}
