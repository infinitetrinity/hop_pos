// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'screening_venue.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ScreeningVenueImpl _$$ScreeningVenueImplFromJson(Map<String, dynamic> json) =>
    _$ScreeningVenueImpl(
      id: json['id'] as int,
      name: json['name'] as String,
      fullAddress: json['full_address'] as String?,
      screeningFormId: json['screening_form_id'] as int,
    );

Map<String, dynamic> _$$ScreeningVenueImplToJson(
        _$ScreeningVenueImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'full_address': instance.fullAddress,
      'screening_form_id': instance.screeningFormId,
    };
