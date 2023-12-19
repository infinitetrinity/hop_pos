import 'package:drift/drift.dart';
import 'package:hop_pos/src/receipt_settings/models/receipt_setting.dart';

@UseRowClass(ReceiptSetting)
class ReceiptSettingsTable extends Table {
  @override
  String get tableName => 'receipt_settings';
  IntColumn get id => integer().autoIncrement()();
  TextColumn get footerText => text().nullable().withLength(max: 999)();
  TextColumn get outstandingSpecimenTitle =>
      text().nullable().withLength(max: 999)();
  TextColumn get outstandingSpecimenNoticeTitle =>
      text().nullable().withLength(max: 999)();
  TextColumn get outstandingSpecimenNotice =>
      text().nullable().withLength(max: 999)();
  TextColumn get utfTitle => text().nullable().withLength(max: 999)();
  TextColumn get utfNotice => text().nullable().withLength(max: 999)();
  TextColumn get stfTitle => text().nullable().withLength(max: 999)();
  TextColumn get stfNotice => text().nullable().withLength(max: 999)();
}
