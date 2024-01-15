import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hop_pos/src/screening_venues/models/screening_venue_with_timeslots.dart';
import 'package:hop_pos/src/screenings/models/screening.dart';

part 'screening_with_venues_and_timeslots.freezed.dart';
part 'screening_with_venues_and_timeslots.g.dart';

@freezed
class ScreeningWithVenuesAndTimeslots with _$ScreeningWithVenuesAndTimeslots {
  const factory ScreeningWithVenuesAndTimeslots({
    required Screening screening,
    required List<ScreeningVenueWithTimeslots> venuesWithTimeslots,
  }) = _ScreeningWithVenuesAndTimeslots;

  factory ScreeningWithVenuesAndTimeslots.fromJson(Map<String, dynamic> json) => _$ScreeningWithVenuesAndTimeslotsFromJson(json);
}
