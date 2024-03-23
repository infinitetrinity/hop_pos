// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'to_delete_record_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ToDeleteRecordDataImpl _$$ToDeleteRecordDataImplFromJson(
        Map<String, dynamic> json) =>
    _$ToDeleteRecordDataImpl(
      model: $enumDecode(_$ToDeleteModelsEnumMap, json['model']),
      modelId: json['model_id'] as String,
    );

Map<String, dynamic> _$$ToDeleteRecordDataImplToJson(
        _$ToDeleteRecordDataImpl instance) =>
    <String, dynamic>{
      'model': _$ToDeleteModelsEnumMap[instance.model]!,
      'model_id': instance.modelId,
    };

const _$ToDeleteModelsEnumMap = {
  ToDeleteModels.customers: 'customers',
  ToDeleteModels.products: 'products',
  ToDeleteModels.product_categories: 'product_categories',
  ToDeleteModels.screenings: 'screenings',
  ToDeleteModels.screening_venues: 'screening_venues',
  ToDeleteModels.screening_timeslots: 'screening_timeslots',
  ToDeleteModels.screening_registrations: 'screening_registrations',
  ToDeleteModels.payment_methods: 'payment_methods',
};
