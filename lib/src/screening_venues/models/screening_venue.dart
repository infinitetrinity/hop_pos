import 'package:drift/drift.dart' as drift;
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hop_pos/app/app_db.dart';

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

  const ScreeningVenue._();

  factory ScreeningVenue.fromJson(Map<String, dynamic> json) => _$ScreeningVenueFromJson(json);

  static List<ScreeningVenue> fromJsonList(dynamic data) {
    return List<ScreeningVenue>.from(
      data.map((el) => ScreeningVenue.fromJson(el)),
    );
  }

  ScreeningVenuesTableCompanion toData() {
    return ScreeningVenuesTableCompanion(
      id: drift.Value(id),
      name: drift.Value(name),
      fullAddress: drift.Value(fullAddress),
      screeningFormId: drift.Value(screeningFormId),
    );
  }
}
