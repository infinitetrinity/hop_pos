import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hop_pos/src/common/models/sync_new_record_data.dart';
import 'package:hop_pos/src/to_sync_data/models/to_sync_data.dart';

part 'sync_server_data.freezed.dart';
part 'sync_server_data.g.dart';

@freezed
class SyncServerData with _$SyncServerData {
  const factory SyncServerData({
    @JsonKey(name: 'license_key') required String licenseKey,
    @JsonKey(name: 'last_sync') required DateTime lastSync,
    @JsonKey(name: 'new_records') required SyncNewRecordData newRecords,
    @JsonKey(name: 'sync_records') required List<ToSyncData> syncRecords,
  }) = _SyncServerData;

  factory SyncServerData.fromJson(Map<String, dynamic> json) => _$SyncServerDataFromJson(json);
}
