import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hop_pos/src/screening_timeslots/models/screening_timeslot.dart';
import 'package:hop_pos/src/screening_venues/models/screening_venue.dart';

part 'screening_timeslot_with_venue.freezed.dart';
part 'screening_timeslot_with_venue.g.dart';

@freezed
class ScreeningTimeslotWithVenue with _$ScreeningTimeslotWithVenue {
  const factory ScreeningTimeslotWithVenue({
    required ScreeningTimeslot timeslot,
    required ScreeningVenue venue,
  }) = _ScreeningTimeslotWithVenue;

  const ScreeningTimeslotWithVenue._();

  factory ScreeningTimeslotWithVenue.fromJson(Map<String, dynamic> json) => _$ScreeningTimeslotWithVenueFromJson(json);
}
