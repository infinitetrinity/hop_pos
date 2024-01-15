// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'screening_with_venues_and_timeslots.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ScreeningWithVenuesAndTimeslotsImpl
    _$$ScreeningWithVenuesAndTimeslotsImplFromJson(Map<String, dynamic> json) =>
        _$ScreeningWithVenuesAndTimeslotsImpl(
          screening:
              Screening.fromJson(json['screening'] as Map<String, dynamic>),
          venuesWithTimeslots: (json['venuesWithTimeslots'] as List<dynamic>)
              .map((e) => ScreeningVenueWithTimeslots.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
        );

Map<String, dynamic> _$$ScreeningWithVenuesAndTimeslotsImplToJson(
        _$ScreeningWithVenuesAndTimeslotsImpl instance) =>
    <String, dynamic>{
      'screening': instance.screening,
      'venuesWithTimeslots': instance.venuesWithTimeslots,
    };
