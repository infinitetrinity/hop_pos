import 'package:drift/drift.dart';
import 'package:hop_pos/src/customers/models/customers_table.dart';
import 'package:hop_pos/src/orders/models/order.dart';
import 'package:hop_pos/src/screenings/models/screenings_table.dart';

@TableIndex(name: 'orders_id', columns: {#id}, unique: true)
@TableIndex(name: 'orders_license_id', columns: {#licenseId})
@TableIndex(name: 'orders_screening_id', columns: {#screeningId})
@TableIndex(name: 'orders_customer_id', columns: {#customerId})
@UseRowClass(Order)
class OrdersTable extends Table {
  @override
  String get tableName => 'orders';
  IntColumn get id => integer().autoIncrement()();
  BoolColumn get isStf => boolean()();
  BoolColumn get isUtf => boolean()();
  TextColumn get salesNote => text().nullable().withLength(max: 255)();
  TextColumn get invoiceNo => text().withLength(max: 255)();
  TextColumn get invoicePrefix => text().withLength(max: 255)();
  RealColumn get discount => real().nullable()();
  TextColumn get discountType => text().nullable().withLength(max: 255)();
  RealColumn get subtotal => real()();
  RealColumn get extrasTotal => real()();
  RealColumn get netTotal => real()();
  RealColumn get rounding => real().nullable()();
  IntColumn get licenseId => integer()();
  IntColumn get screeningId => integer().nullable().references(ScreeningsTable, #id, onDelete: KeyAction.cascade)();
  IntColumn get customerId => integer().references(CustomersTable, #id, onDelete: KeyAction.cascade)();
  DateTimeColumn get createdAt => dateTime()();
}
