import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hop_pos/src/screening_timeslots/models/screening_timeslot.dart';
import 'package:hop_pos/src/screenings/models/screening.dart';

part 'screening_with_timeslots.freezed.dart';
part 'screening_with_timeslots.g.dart';

@freezed
class ScreeningWithTimeslots with _$ScreeningWithTimeslots {
  const factory ScreeningWithTimeslots({
    required Screening screening,
    required List<ScreeningTimeslot> timeslots,
  }) = _ScreeningWithTimeslots;

  factory ScreeningWithTimeslots.fromJson(Map<String, dynamic> json) => _$ScreeningWithTimeslotsFromJson(json);
}
