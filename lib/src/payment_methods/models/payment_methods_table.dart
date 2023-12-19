import 'package:drift/drift.dart';
import 'package:hop_pos/src/payment_methods/models/payment_method.dart';

@UseRowClass(PaymentMethod)
class PaymentMethodsTable extends Table {
  @override
  String get tableName => 'payment_methods';
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(max: 255)();
  TextColumn get description => text().nullable().withLength(max: 255)();
}
