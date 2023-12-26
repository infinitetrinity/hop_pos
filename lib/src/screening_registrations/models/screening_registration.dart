import 'package:freezed_annotation/freezed_annotation.dart';

part 'screening_registration.freezed.dart';
part 'screening_registration.g.dart';

@freezed
class ScreeningRegistration with _$ScreeningRegistration {
  const factory ScreeningRegistration({
    required int index,
    @JsonKey(name: 'customer_id') required int customerId,
    @JsonKey(name: 'timeslot_id') required int timeslotId,
  }) = _ScreeningRegistration;

  factory ScreeningRegistration.fromJson(Map<String, dynamic> json) =>
      _$ScreeningRegistrationFromJson(json);

  static List<ScreeningRegistration> fromJsonList(dynamic data) {
    return List<ScreeningRegistration>.from(
      data.map((el) => ScreeningRegistration.fromJson(el)),
    );
  }

  static String get table {
    return 'screening_registrations';
  }
}
