import 'package:drift/drift.dart';
import 'package:hop_pos/src/company/models/company.dart';

@UseRowClass(Company)
class CompanyTable extends Table {
  @override
  String get tableName => Company.table;
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(max: 255)();
  TextColumn get address => text().withLength(max: 255)();
  TextColumn get postalCode => text().withLength(max: 255)();
  TextColumn get email => text().withLength(max: 255)();
  TextColumn get telephone => text().withLength(max: 255)();
  TextColumn get fax => text().withLength(max: 255)();
  TextColumn get website => text().withLength(max: 255)();
  TextColumn get coRegistrationNo => text().withLength(max: 255)();
}
