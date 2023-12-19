import 'package:drift/drift.dart';
import 'package:hop_pos/app/app_db.dart';
import 'package:hop_pos/src/receipt_settings/models/receipt_setting.dart';
import 'package:hop_pos/src/receipt_settings/models/receipt_settings_table.dart';

part 'receipt_setting_dao.g.dart';

@DriftAccessor(tables: [ReceiptSettingsTable])
class ReceiptSettingDao extends DatabaseAccessor<AppDb>
    with _$ReceiptSettingDaoMixin {
  ReceiptSettingDao(AppDb db) : super(db);

  Future<ReceiptSetting> insertSetting(
      ReceiptSettingsTableCompanion setting) async {
    return await into(receiptSettingsTable).insertReturning(setting);
  }

  Future<bool> updateSetting(
      ReceiptSettingsTableCompanion setting, Expression<bool> where) async {
    final count = await (update(receiptSettingsTable)..where((_) => where))
        .write(setting);
    return count > 0;
  }
}
