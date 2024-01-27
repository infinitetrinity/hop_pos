import 'package:drift/drift.dart';
import 'package:hop_pos/src/orders/models/new_order.dart';
import 'package:hop_pos/src/screenings/models/screenings_table.dart';

@UseRowClass(NewOrder)
class NewOrdersTable extends Table {
  @override
  String get tableName => 'new_orders';
  IntColumn get id => integer().autoIncrement()();
  BoolColumn get isStf => boolean()();
  BoolColumn get isUtf => boolean()();
  BoolColumn get eReceipt => boolean()();
  TextColumn get salesNote => text().nullable().withLength(max: 255)();
  TextColumn get invoiceNo => text().withLength(max: 255)();
  TextColumn get invoicePrefix => text().withLength(max: 255)();
  RealColumn get discount => real().nullable()();
  TextColumn get discountType => text().nullable().withLength(max: 255)();
  RealColumn get subtotal => real()();
  RealColumn get extrasTotal => real()();
  RealColumn get netTotal => real()();
  RealColumn get rounding => real().nullable()();
  IntColumn get screeningId => integer().references(ScreeningsTable, #id, onDelete: KeyAction.cascade)();
  TextColumn get customerNric => text().withLength(max: 255).references(ScreeningsTable, #nric, onDelete: KeyAction.cascade)();
  DateTimeColumn get createdAt => dateTime()();
}
