// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'screening_venue_with_timeslots.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ScreeningVenueWithTimeslotsImpl _$$ScreeningVenueWithTimeslotsImplFromJson(
        Map<String, dynamic> json) =>
    _$ScreeningVenueWithTimeslotsImpl(
      venue: ScreeningVenue.fromJson(json['venue'] as Map<String, dynamic>),
      timeslots: (json['timeslots'] as List<dynamic>)
          .map((e) => ScreeningTimeslot.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ScreeningVenueWithTimeslotsImplToJson(
        _$ScreeningVenueWithTimeslotsImpl instance) =>
    <String, dynamic>{
      'venue': instance.venue,
      'timeslots': instance.timeslots,
    };
