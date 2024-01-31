import 'package:drift/drift.dart';
import 'package:hop_pos/src/pos_licenses/models/pos_license.dart';

@TableIndex(name: 'pos_licenses_id', columns: {#id}, unique: true)
@UseRowClass(PosLicense)
class PosLicensesTable extends Table {
  @override
  String get tableName => 'pos_licenses';
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(max: 255)();
  TextColumn get invoicePrefix => text().withLength(max: 255)();
  TextColumn get licenseKey => text().withLength(max: 255)();
  TextColumn get password => text().withLength(max: 255)();
  BoolColumn get isActive => boolean()();
  BoolColumn get isActivated => boolean()();
}
