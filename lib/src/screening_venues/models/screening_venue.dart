import 'package:freezed_annotation/freezed_annotation.dart';

part 'screening_venue.freezed.dart';
part 'screening_venue.g.dart';

@freezed
class ScreeningVenue with _$ScreeningVenue {
  const factory ScreeningVenue({
    required int id,
    required String name,
    @JsonKey(name: 'full_address') String? fullAddress,
    @JsonKey(name: 'screening_form_id') required int screeningFormId,
  }) = _ScreeningVenue;

  factory ScreeningVenue.fromJson(Map<String, dynamic> json) =>
      _$ScreeningVenueFromJson(json);

  static List<ScreeningVenue> fromJsonList(dynamic data) {
    return List<ScreeningVenue>.from(
      data.map((el) => ScreeningVenue.fromJson(el)),
    );
  }

  static String get table {
    return 'screening_venues';
  }
}
