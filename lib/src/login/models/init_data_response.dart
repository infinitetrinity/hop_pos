import 'package:drift/drift.dart' as drift;
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hop_pos/app/app_db.dart';
import 'package:hop_pos/src/customers/models/customer.dart';
import 'package:hop_pos/src/order_extras/models/order_extra.dart';
import 'package:hop_pos/src/order_items/models/order_item.dart';
import 'package:hop_pos/src/order_payments/models/order_payment.dart';
import 'package:hop_pos/src/orders/models/order.dart';
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
    required int lastPage,
    required List<Customer> customers,
    required List<Screening> screenings,
    required List<ScreeningVenue> venues,
    required List<ScreeningTimeslot> timeslots,
    required List<ScreeningRegistration> registrations,
    required List<Order> orders,
    required List<OrderItem> orderItems,
    required List<OrderExtra> orderExtras,
    required List<OrderPayment> orderPayments,
  }) = _InitDataResponse;

  factory InitDataResponse.fromJson(Map<String, dynamic> json) {
    return InitDataResponse(
      hasNextPage: _checkHasNextPage(json),
      lastPage: _getLastPage(json),
      customers: Customer.fromJsonList(json['customers']['data']),
      screenings: Screening.fromJsonList(json['screenings']['data']),
      venues: ScreeningVenue.fromJsonList(json['screening_venues']['data']),
      timeslots: ScreeningTimeslot.fromJsonList(json['screening_timeslots']['data']),
      registrations: ScreeningRegistration.fromJsonList(json['screening_registrations']['data']),
      orders: Order.fromJsonList(json['orders']['data']),
      orderItems: OrderItem.fromJsonList(json['order_items']['data']),
      orderExtras: OrderExtra.fromJsonList(json['order_extras']['data']),
      orderPayments: OrderPayment.fromJsonList(json['order_payments']['data']),
    );
  }

  static bool _checkHasNextPage(Map<String, dynamic> data) {
    return data.values.any(
      (el) => el['meta']['has_more_pages'] ?? false,
    );
  }

  static int _getLastPage(Map<String, dynamic> data) {
    return data.values.fold(
      0,
      (maxPage, el) => (el['meta']['last_page'] ?? 0) > maxPage ? (el['meta']['last_page'] ?? 0) : maxPage,
    );
  }

  List<CustomersTableCompanion> getCustomersData() {
    return customers
        .map(
          (customer) => CustomersTableCompanion(
            id: drift.Value(customer.id!),
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
            specimenCollectionDate: drift.Value(timeslot.specimenCollectionDate),
            specimenCollectionTime: drift.Value(timeslot.specimenCollectionTime),
            specimenCollectionVenue: drift.Value(timeslot.specimenCollectionVenue),
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
            customerId: drift.Value.ofNullable(registration.customerId),
            timeslotId: drift.Value.ofNullable(registration.timeslotId),
          ),
        )
        .toList();
  }

  List<OrdersTableCompanion> getOrdersData() {
    return orders
        .map(
          (order) => OrdersTableCompanion(
            id: drift.Value.ofNullable(order.id),
            isStf: drift.Value(order.isStf ?? false),
            isUtf: drift.Value(order.isUtf ?? false),
            salesNote: drift.Value(order.salesNote),
            invoiceNo: drift.Value.ofNullable(order.invoiceNo),
            invoicePrefix: drift.Value.ofNullable(order.invoicePrefix),
            discount: drift.Value(order.discount),
            discountType: drift.Value(order.discountType),
            subtotal: drift.Value(order.subtotal ?? 0),
            extrasTotal: drift.Value(order.extrasTotal ?? 0),
            netTotal: drift.Value(order.netTotal ?? 0),
            rounding: drift.Value(order.rounding),
            licenseId: drift.Value.ofNullable(order.licenseId),
            screeningId: drift.Value(order.screeningId),
            customerId: drift.Value.ofNullable(order.customerId),
            createdAt: drift.Value.ofNullable(order.createdAt),
          ),
        )
        .toList();
  }

  List<OrderItemsTableCompanion> getOrderItemsData() {
    return orderItems.map((item) => item.toData as OrderItemsTableCompanion).toList();
  }

  List<OrderExtrasTableCompanion> getOrderExtrasData() {
    return orderExtras
        .map(
          (extra) => OrderExtrasTableCompanion(
            id: drift.Value(extra.id),
            name: drift.Value(extra.name),
            type: drift.Value(extra.type),
            description: drift.Value(extra.description),
            amount: drift.Value(extra.amount ?? 0),
            amountType: drift.Value(extra.amountType),
            calculatedAmount: drift.Value(extra.calculatedAmount ?? 0),
            extraId: drift.Value(extra.extraId),
            orderId: drift.Value(extra.orderId),
          ),
        )
        .toList();
  }

  List<OrderPaymentsTableCompanion> getOrderPaymentsData() {
    return orderPayments
        .map(
          (payment) => OrderPaymentsTableCompanion(
            id: drift.Value(payment.id),
            amount: drift.Value(payment.amount ?? 0),
            orderId: drift.Value(payment.orderId),
            paymentMethodId: drift.Value(payment.paymentMethodId),
            createdAt: drift.Value(payment.createdAt),
          ),
        )
        .toList();
  }
}
