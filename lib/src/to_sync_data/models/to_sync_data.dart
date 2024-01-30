import 'package:freezed_annotation/freezed_annotation.dart';

part 'to_sync_data.freezed.dart';
part 'to_sync_data.g.dart';

enum ToSyncActions { update }

enum ToSyncModels { customers }

@freezed
class ToSyncData with _$ToSyncData {
  const factory ToSyncData({
    required int id,
    required ToSyncModels model,
    @JsonKey(name: 'model_id') required int modelId,
    required ToSyncActions action,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    required Map<String, dynamic> value,
  }) = _ToSyncData;

  factory ToSyncData.fromJson(Map<String, dynamic> json) =>
      _$ToSyncDataFromJson(json);
}
