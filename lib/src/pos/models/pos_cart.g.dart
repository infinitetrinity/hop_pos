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
          : CustomerWithRegistration.fromJson(
              json['customer'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PosCartImplToJson(_$PosCartImpl instance) =>
    <String, dynamic>{
      'screening': instance.screening,
      'customer': instance.customer,
    };
