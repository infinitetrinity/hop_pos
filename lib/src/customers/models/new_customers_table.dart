import 'package:drift/drift.dart';
import 'package:hop_pos/src/customers/models/customer.dart';

@UseRowClass(Customer)
class NewCustomersTable extends Table {
  @override
  String get tableName => 'new_customers';
  IntColumn get id => integer().autoIncrement()();
  TextColumn get fullName => text().withLength(max: 255)();
  TextColumn get nric => text().withLength(max: 255)();
  DateTimeColumn get dob => dateTime().nullable()();
  TextColumn get gender => text().withLength(max: 255).nullable()();
  TextColumn get email => text().withLength(max: 255).nullable()();
  TextColumn get mobileNo => text().withLength(max: 255).nullable()();
  BoolColumn get sendAccountInvitation => boolean()();
  DateTimeColumn get createdAt => dateTime()();
}
