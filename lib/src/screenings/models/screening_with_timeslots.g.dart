// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'screening_with_timeslots.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ScreeningWithTimeslotsImpl _$$ScreeningWithTimeslotsImplFromJson(
        Map<String, dynamic> json) =>
    _$ScreeningWithTimeslotsImpl(
      screening: Screening.fromJson(json['screening'] as Map<String, dynamic>),
      timeslots: (json['timeslots'] as List<dynamic>)
          .map((e) => ScreeningTimeslot.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ScreeningWithTimeslotsImplToJson(
        _$ScreeningWithTimeslotsImpl instance) =>
    <String, dynamic>{
      'screening': instance.screening,
      'timeslots': instance.timeslots,
    };
