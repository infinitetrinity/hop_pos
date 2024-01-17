// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'screening_timeslot_with_venue.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ScreeningTimeslotWithVenueImpl _$$ScreeningTimeslotWithVenueImplFromJson(
        Map<String, dynamic> json) =>
    _$ScreeningTimeslotWithVenueImpl(
      timeslot:
          ScreeningTimeslot.fromJson(json['timeslot'] as Map<String, dynamic>),
      venue: ScreeningVenue.fromJson(json['venue'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ScreeningTimeslotWithVenueImplToJson(
        _$ScreeningTimeslotWithVenueImpl instance) =>
    <String, dynamic>{
      'timeslot': instance.timeslot,
      'venue': instance.venue,
    };
