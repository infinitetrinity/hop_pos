import 'package:freezed_annotation/freezed_annotation.dart';

part 'screening_registration.freezed.dart';
part 'screening_registration.g.dart';

@freezed
class ScreeningRegistration with _$ScreeningRegistration {
  const factory ScreeningRegistration({
    int? id,
    String? index,
    @JsonKey(name: 'customer_nric') String? customerNric,
    @JsonKey(name: 'customer_id') int? customerId,
    @JsonKey(name: 'timeslot_id') required int timeslotId,
    @JsonKey(name: 'created_at') DateTime? createdAt,
  }) = _ScreeningRegistration;

  factory ScreeningRegistration.fromJson(Map<String, dynamic> json) => _$ScreeningRegistrationFromJson(json);

  static List<ScreeningRegistration> fromJsonList(dynamic data) {
    return List<ScreeningRegistration>.from(
      data.map((el) => ScreeningRegistration.fromJson(el)),
    );
  }
}
