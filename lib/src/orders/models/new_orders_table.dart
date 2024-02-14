import 'package:drift/drift.dart';
import 'package:hop_pos/src/orders/models/order.dart';
import 'package:hop_pos/src/screenings/models/screenings_table.dart';

@TableIndex(name: 'new_orders_id', columns: {#id}, unique: true)
@TableIndex(name: 'new_orders_screening_id', columns: {#screeningId})
@TableIndex(name: 'new_orders_customer_nric', columns: {#customerNric})
@UseRowClass(Order)
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
  TextColumn get discountType => textEnum<DiscountType>().nullable()();
  RealColumn get subtotal => real()();
  RealColumn get extrasTotal => real()();
  RealColumn get netTotal => real()();
  RealColumn get rounding => real().nullable()();
  IntColumn get screeningId => integer().references(ScreeningsTable, #id, onDelete: KeyAction.cascade)();
  TextColumn get customerNric => text().withLength(max: 255)();
  DateTimeColumn get createdAt => dateTime()();
}
