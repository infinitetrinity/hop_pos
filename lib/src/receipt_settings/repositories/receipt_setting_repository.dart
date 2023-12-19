import 'package:drift/drift.dart';
import 'package:hop_pos/app/app_db.dart';
import 'package:hop_pos/src/receipt_settings/daos/receipt_setting_dao.dart';
import 'package:hop_pos/src/receipt_settings/models/receipt_setting.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'receipt_setting_repository.g.dart';

@riverpod
ReceiptSettingRepository receiptSettingRepo(ReceiptSettingRepoRef ref) {
  return ReceiptSettingRepository(
    receiptSettingDao:
        ref.watch(appDbProvider.select((prov) => prov.receiptSettingDao)),
  );
}

class ReceiptSettingRepository {
  final ReceiptSettingDao receiptSettingDao;

  ReceiptSettingRepository({
    required this.receiptSettingDao,
  });

  Future<ReceiptSetting> insert(ReceiptSettingsTableCompanion setting) {
    return receiptSettingDao.insertSetting(setting);
  }

  Future<bool> update(
      ReceiptSettingsTableCompanion setting, Expression<bool> where) {
    return receiptSettingDao.updateSetting(setting, where);
  }
}
