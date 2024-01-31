// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'screening_registration.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ScreeningRegistrationImpl _$$ScreeningRegistrationImplFromJson(
        Map<String, dynamic> json) =>
    _$ScreeningRegistrationImpl(
      id: json['id'] as int?,
      index: json['index'] as String?,
      customerNric: json['customer_nric'] as String?,
      customerId: json['customer_id'] as int?,
      timeslotId: json['timeslot_id'] as int,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$$ScreeningRegistrationImplToJson(
        _$ScreeningRegistrationImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'index': instance.index,
      'customer_nric': instance.customerNric,
      'customer_id': instance.customerId,
      'timeslot_id': instance.timeslotId,
      'created_at': instance.createdAt?.toIso8601String(),
    };
