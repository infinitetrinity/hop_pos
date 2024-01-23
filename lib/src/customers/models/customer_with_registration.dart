import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hop_pos/src/customers/models/customer.dart';
import 'package:hop_pos/src/screening_registrations/models/screening_registration.dart';

part 'customer_with_registration.freezed.dart';
part 'customer_with_registration.g.dart';

@freezed
class CustomerWithRegistration with _$CustomerWithRegistration {
  const factory CustomerWithRegistration({
    required Customer customer,
    required ScreeningRegistration registration,
    @Default(false) bool hasSales,
  }) = _CustomerWithRegistration;

  factory CustomerWithRegistration.fromJson(Map<String, dynamic> json) => _$CustomerWithRegistrationFromJson(json);
}
