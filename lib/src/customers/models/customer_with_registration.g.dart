// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_with_registration.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CustomerWithRegistrationImpl _$$CustomerWithRegistrationImplFromJson(
        Map<String, dynamic> json) =>
    _$CustomerWithRegistrationImpl(
      customer: Customer.fromJson(json['customer'] as Map<String, dynamic>),
      screening: Screening.fromJson(json['screening'] as Map<String, dynamic>),
      timeslot: json['timeslot'] == null
          ? null
          : ScreeningTimeslot.fromJson(
              json['timeslot'] as Map<String, dynamic>),
      registration: ScreeningRegistration.fromJson(
          json['registration'] as Map<String, dynamic>),
      order: json['order'] == null
          ? null
          : PosOrder.fromJson(json['order'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$CustomerWithRegistrationImplToJson(
        _$CustomerWithRegistrationImpl instance) =>
    <String, dynamic>{
      'customer': instance.customer,
      'screening': instance.screening,
      'timeslot': instance.timeslot,
      'registration': instance.registration,
      'order': instance.order,
    };
