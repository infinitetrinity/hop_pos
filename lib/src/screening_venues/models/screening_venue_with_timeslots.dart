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

  const ScreeningVenueWithTimeslots._();

  factory ScreeningVenueWithTimeslots.fromJson(Map<String, dynamic> json) => _$ScreeningVenueWithTimeslotsFromJson(json);

  List<ScreeningTimeslot> get orderedTimeslots {
    final now = DateTime.now().toLocal();
    final midnight = DateTime(now.year, now.month, now.day);

    final result = [...timeslots];
    result.sort((a, b) {
      final aIsUpcoming = a.dateAndTime.isAfter(midnight);
      final bIsUpcoming = b.dateAndTime.isAfter(midnight);

      if (aIsUpcoming && !bIsUpcoming) {
        return -1;
      }

      if (!aIsUpcoming && bIsUpcoming) {
        return 1;
      }

      final dateComparison = a.dateAndTime.compareTo(b.dateAndTime);
      return aIsUpcoming ? dateComparison : -dateComparison;
    });

    return result;
  }
}
