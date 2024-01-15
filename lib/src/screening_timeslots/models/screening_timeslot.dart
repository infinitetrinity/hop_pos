import 'package:freezed_annotation/freezed_annotation.dart';

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

  factory ScreeningTimeslot.fromJson(Map<String, dynamic> json) => _$ScreeningTimeslotFromJson(json);

  static List<ScreeningTimeslot> fromJsonList(dynamic data) {
    return List<ScreeningTimeslot>.from(
      data.map((el) => ScreeningTimeslot.fromJson(el)),
    );
  }

  static String get table {
    return 'screening_timeslots';
  }
}
