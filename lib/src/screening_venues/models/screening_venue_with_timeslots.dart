import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hop_pos/src/screening_timeslots/models/screening_timeslot.dart';
import 'package:hop_pos/src/screening_venues/models/screening_venue.dart';

part 'screening_venue_with_timeslots.freezed.dart';
part 'screening_venue_with_timeslots.g.dart';

@freezed
class ScreeningVenueWithTimeslots with _$ScreeningVenueWithTimeslots {
  const factory ScreeningVenueWithTimeslots({
    required ScreeningVenue venue,
    required List<ScreeningTimeslot> timeslots,
  }) = _ScreeningVenueWithTimeslots;

  factory ScreeningVenueWithTimeslots.fromJson(Map<String, dynamic> json) => _$ScreeningVenueWithTimeslotsFromJson(json);
}
