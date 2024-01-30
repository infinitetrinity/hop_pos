// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'to_sync_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ToSyncDataImpl _$$ToSyncDataImplFromJson(Map<String, dynamic> json) =>
    _$ToSyncDataImpl(
      id: json['id'] as int,
      model: json['model'] as String,
      modelId: json['model_id'] as int,
      action: json['action'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      value: json['value'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$$ToSyncDataImplToJson(_$ToSyncDataImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'model': instance.model,
      'model_id': instance.modelId,
      'action': instance.action,
      'created_at': instance.createdAt.toIso8601String(),
      'value': instance.value,
    };
