// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'to_sync_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ToSyncDataImpl _$$ToSyncDataImplFromJson(Map<String, dynamic> json) =>
    _$ToSyncDataImpl(
      id: json['id'] as int,
      model: $enumDecode(_$ToSyncModelsEnumMap, json['model']),
      modelId: json['model_id'] as int,
      action: $enumDecode(_$ToSyncActionsEnumMap, json['action']),
      createdAt: DateTime.parse(json['created_at'] as String),
      value: json['value'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$$ToSyncDataImplToJson(_$ToSyncDataImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'model': _$ToSyncModelsEnumMap[instance.model]!,
      'model_id': instance.modelId,
      'action': _$ToSyncActionsEnumMap[instance.action]!,
      'created_at': instance.createdAt.toIso8601String(),
      'value': instance.value,
    };

const _$ToSyncModelsEnumMap = {
  ToSyncModels.customers: 'customers',
  ToSyncModels.orders: 'orders',
  ToSyncModels.order_extras: 'order_extras',
};

const _$ToSyncActionsEnumMap = {
  ToSyncActions.update: 'update',
};
