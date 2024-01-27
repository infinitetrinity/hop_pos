import 'package:freezed_annotation/freezed_annotation.dart';

part 'new_screening_registration.freezed.dart';
part 'new_screening_registration.g.dart';

@freezed
class NewScreeningRegistration with _$NewScreeningRegistration {
  const factory NewScreeningRegistration({
    required int id,
    String? index,
    @JsonKey(name: 'customer_nric') String? customerNric,
    @JsonKey(name: 'timeslot_id') required int timeslotId,
    @JsonKey(name: 'created_at') required DateTime createdAt,
  }) = _NewScreeningRegistration;

  factory NewScreeningRegistration.fromJson(Map<String, dynamic> json) => _$NewScreeningRegistrationFromJson(json);
}
