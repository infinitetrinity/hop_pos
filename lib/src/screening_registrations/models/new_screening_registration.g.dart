// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_screening_registration.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NewScreeningRegistrationImpl _$$NewScreeningRegistrationImplFromJson(
        Map<String, dynamic> json) =>
    _$NewScreeningRegistrationImpl(
      id: json['id'] as int,
      index: json['index'] as String?,
      customerNric: json['customer_nric'] as String?,
      timeslotId: json['timeslot_id'] as int,
      createdAt: DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$$NewScreeningRegistrationImplToJson(
        _$NewScreeningRegistrationImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'index': instance.index,
      'customer_nric': instance.customerNric,
      'timeslot_id': instance.timeslotId,
      'created_at': instance.createdAt.toIso8601String(),
    };
