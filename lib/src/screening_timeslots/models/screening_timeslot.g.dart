// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'screening_timeslot.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ScreeningTimeslotImpl _$$ScreeningTimeslotImplFromJson(
        Map<String, dynamic> json) =>
    _$ScreeningTimeslotImpl(
      id: json['id'] as int,
      dateAndTime: DateTime.parse(json['date_time'] as String),
      slots: json['slots'] as int,
      specimenCollectionDate: json['specimen_collection_date'] == null
          ? null
          : DateTime.parse(json['specimen_collection_date'] as String),
      specimenCollectionTime: json['specimen_collection_time'] as String?,
      specimenCollectionVenue: json['specimen_collection_venue'] as String?,
      screeningId: json['screening_id'] as int,
      venueId: json['venue_id'] as int,
    );

Map<String, dynamic> _$$ScreeningTimeslotImplToJson(
        _$ScreeningTimeslotImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'date_time': instance.dateAndTime.toIso8601String(),
      'slots': instance.slots,
      'specimen_collection_date':
          instance.specimenCollectionDate?.toIso8601String(),
      'specimen_collection_time': instance.specimenCollectionTime,
      'specimen_collection_venue': instance.specimenCollectionVenue,
      'screening_id': instance.screeningId,
      'venue_id': instance.venueId,
    };
