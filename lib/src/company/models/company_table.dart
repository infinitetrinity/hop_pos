import 'package:drift/drift.dart';
import 'package:hop_pos/src/company/models/company.dart';

@UseRowClass(Company)
class CompanyTable extends Table {
  @override
  String get tableName => 'company';
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(max: 255)();
  TextColumn get address => text().nullable().withLength(max: 999)();
  TextColumn get postalCode => text().nullable().withLength(max: 255)();
  TextColumn get email => text().nullable().withLength(max: 255)();
  TextColumn get telephone => text().nullable().withLength(max: 255)();
  TextColumn get fax => text().nullable().withLength(max: 255)();
  TextColumn get website => text().nullable().withLength(max: 255)();
  TextColumn get coRegistrationNo => text().nullable().withLength(max: 255)();
}
