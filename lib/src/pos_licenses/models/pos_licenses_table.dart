import 'package:drift/drift.dart';
import 'package:hop_pos/src/pos_licenses/models/pos_license.dart';

@UseRowClass(PosLicense)
class PosLicensesTable extends Table {
  @override
  String get tableName => PosLicense.table;
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(max: 255)();
  TextColumn get invoicePrefix => text().withLength(max: 255)();
  TextColumn get licenseKey => text().withLength(max: 255)();
  TextColumn get password => text().withLength(max: 255)();
  BoolColumn get isActive => boolean()();
  BoolColumn get isActivated => boolean()();
}
