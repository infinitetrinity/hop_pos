import 'package:drift/drift.dart';
import 'package:hop_pos/src/customers/models/customer.dart';

@UseRowClass(Customer)
class CustomersTable extends Table {
  @override
  String get tableName => 'customers';
  IntColumn get id => integer().autoIncrement()();
  TextColumn get fullName => text().withLength(max: 255)();
  TextColumn get nric => text().withLength(max: 255).nullable()();
  DateTimeColumn get dob => dateTime().nullable()();
  TextColumn get gender => text().withLength(max: 255).nullable()();
  TextColumn get email => text().withLength(max: 255).nullable()();
  TextColumn get mobileNo => text().withLength(max: 255).nullable()();
  BoolColumn get isPending => boolean()();
}
