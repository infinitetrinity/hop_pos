// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'screening.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ScreeningImpl _$$ScreeningImplFromJson(Map<String, dynamic> json) =>
    _$ScreeningImpl(
      id: json['id'] as int,
      name: json['name'] as String,
      corporate: json['corporate'] as String?,
      isWhitecoatScreening: json['is_whitecoat_screening'] as bool?,
    );

Map<String, dynamic> _$$ScreeningImplToJson(_$ScreeningImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'corporate': instance.corporate,
      'is_whitecoat_screening': instance.isWhitecoatScreening,
    };
