import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hop_pos/app/app_extension.dart';
import 'package:intl/intl.dart';

part 'screening_timeslot.freezed.dart';
part 'screening_timeslot.g.dart';

@freezed
class ScreeningTimeslot with _$ScreeningTimeslot {
  const factory ScreeningTimeslot({
    required int id,
    @JsonKey(name: 'date_time') required DateTime dateAndTime,
    required int slots,
    @JsonKey(name: 'specimen_collection_date') DateTime? specimenCollectionDate,
    @JsonKey(name: 'specimen_collection_time') String? specimenCollectionTime,
    @JsonKey(name: 'specimen_collection_venue') String? specimenCollectionVenue,
    @JsonKey(name: 'screening_id') required int screeningId,
    @JsonKey(name: 'venue_id') required int venueId,
    int? customersCount,
  }) = _ScreeningTimeslot;

  const ScreeningTimeslot._();

  factory ScreeningTimeslot.fromJson(Map<String, dynamic> json) => _$ScreeningTimeslotFromJson(json);

  static List<ScreeningTimeslot> fromJsonList(dynamic data) {
    return List<ScreeningTimeslot>.from(
      data.map((el) => ScreeningTimeslot.fromJson(el)),
    );
  }

  String get displayDate {
    return DateFormat('dd MMM yyyy').format(dateAndTime);
  }

  String get displayDateTime {
    return DateFormat('hh:mm a, dd MMM yyyy').format(dateAndTime);
  }

  String get displaySlots {
    return "$customersCount out of $slots slots";
  }

  bool get hasSpecimenCollection {
    return specimenCollectionDate != null ||
        !specimenCollectionTime.isNullOrEmpty ||
        !specimenCollectionVenue.isNullOrEmpty;
  }

  String? get displaySpecimenCollectionDate {
    return specimenCollectionDate == null ? null : DateFormat('dd MMM yyyy').format(specimenCollectionDate!);
  }
}
