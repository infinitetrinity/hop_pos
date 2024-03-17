import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hop_pos/src/customers/models/customer.dart';
import 'package:hop_pos/src/screening_registrations/models/screening_registration.dart';
import 'package:hop_pos/src/screening_timeslots/models/screening_timeslot.dart';
import 'package:hop_pos/src/screenings/models/screening.dart';

part 'customer_with_registration.freezed.dart';
part 'customer_with_registration.g.dart';

@freezed
class CustomerWithRegistration with _$CustomerWithRegistration {
  const factory CustomerWithRegistration({
    required Customer customer,
    required Screening screening,
    ScreeningTimeslot? timeslot,
    required ScreeningRegistration registration,
  }) = _CustomerWithRegistration;

  factory CustomerWithRegistration.fromJson(Map<String, dynamic> json) => _$CustomerWithRegistrationFromJson(json);
}
