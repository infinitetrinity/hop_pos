import 'package:drift/drift.dart';
import 'package:hop_pos/app/app_db.dart';
import 'package:hop_pos/src/receipt_settings/models/receipt_setting.dart';
import 'package:hop_pos/src/receipt_settings/models/receipt_settings_table.dart';

part 'receipt_setting_dao.g.dart';

@DriftAccessor(tables: [ReceiptSettingsTable])
class ReceiptSettingDao extends DatabaseAccessor<AppDb> with _$ReceiptSettingDaoMixin {
  ReceiptSettingDao(AppDb db) : super(db);

  Future<ReceiptSetting?> getFirst() async {
    final query = select(receiptSettingsTable);

    return (await query.get()).firstOrNull;
  }

  Future<ReceiptSetting> insertSetting(ReceiptSettingsTableCompanion setting) async {
    return await into(receiptSettingsTable).insertReturning(setting);
  }

  Future<void> insertOrUpdate(ReceiptSetting setting) async {
    await into(receiptSettingsTable).insert(setting.toData(), onConflict: DoUpdate((_) => setting.toData()));
  }
}
