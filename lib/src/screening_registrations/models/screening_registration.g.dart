// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'screening_registration.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ScreeningRegistrationImpl _$$ScreeningRegistrationImplFromJson(
        Map<String, dynamic> json) =>
    _$ScreeningRegistrationImpl(
      index: json['index'] as int,
      customerId: json['customer_id'] as int,
      timeslotId: json['timeslot_id'] as int,
    );

Map<String, dynamic> _$$ScreeningRegistrationImplToJson(
        _$ScreeningRegistrationImpl instance) =>
    <String, dynamic>{
      'index': instance.index,
      'customer_id': instance.customerId,
      'timeslot_id': instance.timeslotId,
    };
