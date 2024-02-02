// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pos_cart.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PosCartImpl _$$PosCartImplFromJson(Map<String, dynamic> json) =>
    _$PosCartImpl(
      screening: json['screening'] == null
          ? null
          : Screening.fromJson(json['screening'] as Map<String, dynamic>),
      customer: json['customer'] == null
          ? null
          : Customer.fromJson(json['customer'] as Map<String, dynamic>),
      registration: json['registration'] == null
          ? null
          : ScreeningRegistration.fromJson(
              json['registration'] as Map<String, dynamic>),
      order: json['order'] == null
          ? null
          : PosOrder.fromJson(json['order'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PosCartImplToJson(_$PosCartImpl instance) =>
    <String, dynamic>{
      'screening': instance.screening,
      'customer': instance.customer,
      'registration': instance.registration,
      'order': instance.order,
    };
