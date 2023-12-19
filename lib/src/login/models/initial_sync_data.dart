import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hop_pos/app/app_db.dart';

part 'initial_sync_data.freezed.dart';

@freezed
class InitialSyncData with _$InitialSyncData {
  const InitialSyncData._();

  const factory InitialSyncData({
    required UsersTableCompanion user,
    required PosLicensesTableCompanion posLicense,
    required CompanyTableCompanion company,
    required ReceiptSettingsTableCompanion receiptSettings,
    required List<PosExtrasTableCompanion> posExtras,
  }) = _InitialSyncData;
}
