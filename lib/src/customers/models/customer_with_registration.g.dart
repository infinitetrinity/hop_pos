// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_with_registration.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CustomerWithRegistrationImpl _$$CustomerWithRegistrationImplFromJson(
        Map<String, dynamic> json) =>
    _$CustomerWithRegistrationImpl(
      customer: Customer.fromJson(json['customer'] as Map<String, dynamic>),
      registration: ScreeningRegistration.fromJson(
          json['registration'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$CustomerWithRegistrationImplToJson(
        _$CustomerWithRegistrationImpl instance) =>
    <String, dynamic>{
      'customer': instance.customer,
      'registration': instance.registration,
    };
