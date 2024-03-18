import 'dart:ui';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hop_pos/app/app_colors.dart';
import 'package:hop_pos/src/customers/models/customer.dart';
import 'package:hop_pos/src/orders/models/pos_order.dart';
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
    PosOrder? order,
  }) = _CustomerWithRegistration;

  const CustomerWithRegistration._();

  factory CustomerWithRegistration.fromJson(Map<String, dynamic> json) => _$CustomerWithRegistrationFromJson(json);

  Color get statusColor {
    if (order != null) {
      return AppColors.green500;
    }

    return timeslot?.dateAndTime.isAfter(DateTime.now()) == true ? AppColors.blue500 : AppColors.gray500;
  }

  String get status {
    if (order != null) {
      return 'With Sales';
    }

    return timeslot?.dateAndTime.isAfter(DateTime.now()) == true ? 'Upcoming' : 'Passed';
  }
}
