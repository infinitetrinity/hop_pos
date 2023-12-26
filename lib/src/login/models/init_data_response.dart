import 'package:drift/drift.dart' as drift;
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hop_pos/app/app_db.dart';
import 'package:hop_pos/src/customers/models/customer.dart';
import 'package:hop_pos/src/screening_registrations/models/screening_registration.dart';
import 'package:hop_pos/src/screening_timeslots/models/screening_timeslot.dart';
import 'package:hop_pos/src/screening_venues/models/screening_venue.dart';
import 'package:hop_pos/src/screenings/models/screening.dart';

part 'init_data_response.freezed.dart';

@freezed
class InitDataResponse with _$InitDataResponse {
  const InitDataResponse._();

  const factory InitDataResponse({
    required bool hasNextPage,
    required List<Customer> customers,
    required List<Screening> screenings,
    required List<ScreeningVenue> venues,
    required List<ScreeningTimeslot> timeslots,
    required List<ScreeningRegistration> registrations,
  }) = _InitDataResponse;

  factory InitDataResponse.fromJson(Map<String, dynamic> json) {
    return InitDataResponse(
      hasNextPage: _checkHasNextPage(json),
      customers: Customer.fromJsonList(json['customers']['data']),
      screenings: Screening.fromJsonList(json['screenings']['data']),
      venues: ScreeningVenue.fromJsonList(json['screening_venues']['data']),
      timeslots:
          ScreeningTimeslot.fromJsonList(json['screening_timeslots']['data']),
      registrations: ScreeningRegistration.fromJsonList(
          json['screening_registrations']['data']),
    );
  }

  static bool _checkHasNextPage(Map<String, dynamic> data) {
    return data.values.any(
      (el) => el['meta']['has_more_pages'] ?? false,
    );
  }

  List<CustomersTableCompanion> getCustomersData() {
    return customers
        .map(
          (customer) => CustomersTableCompanion(
            id: drift.Value(customer.id),
            fullName: drift.Value(customer.fullName),
            nric: drift.Value(customer.nric),
            dob: drift.Value(customer.dob),
            gender: drift.Value(customer.gender),
            email: drift.Value(customer.email),
            mobileNo: drift.Value(customer.mobileNo),
            isPending: drift.Value(customer.isPending),
          ),
        )
        .toList();
  }

  List<ScreeningsTableCompanion> getScreeningsData() {
    return screenings
        .map(
          (screening) => ScreeningsTableCompanion(
            id: drift.Value(screening.id),
            name: drift.Value(screening.name),
            corporate: drift.Value(screening.corporate),
          ),
        )
        .toList();
  }

  List<ScreeningVenuesTableCompanion> getScreeningVenuesData() {
    return venues
        .map(
          (venue) => ScreeningVenuesTableCompanion(
            id: drift.Value(venue.id),
            name: drift.Value(venue.name),
            fullAddress: drift.Value(venue.fullAddress),
            screeningFormId: drift.Value(venue.screeningFormId),
          ),
        )
        .toList();
  }

  List<ScreeningTimeslotsTableCompanion> getScreeningTimeslotsData() {
    return timeslots
        .map(
          (timeslot) => ScreeningTimeslotsTableCompanion(
            id: drift.Value(timeslot.id),
            dateAndTime: drift.Value(timeslot.dateAndTime),
            slots: drift.Value(timeslot.slots),
            specimenCollectionDate:
                drift.Value(timeslot.specimenCollectionDate),
            specimenCollectionTime:
                drift.Value(timeslot.specimenCollectionTime),
            specimenCollectionVenue:
                drift.Value(timeslot.specimenCollectionVenue),
            screeningId: drift.Value(timeslot.screeningId),
            venueId: drift.Value(timeslot.venueId),
          ),
        )
        .toList();
  }

  List<ScreeningRegistrationsTableCompanion> getScreeningRegistrationsData() {
    return registrations
        .map(
          (registration) => ScreeningRegistrationsTableCompanion(
            index: drift.Value(registration.index),
            customerId: drift.Value(registration.customerId),
            timeslotId: drift.Value(registration.timeslotId),
          ),
        )
        .toList();
  }
}
