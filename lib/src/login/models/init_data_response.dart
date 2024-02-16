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
    return data.values
        .fold(0, (maxPage, el) => (el['meta']['last_page'] ?? 0) > maxPage ? (el['meta']['last_page'] ?? 0) : maxPage);
  }

  List<CustomersTableCompanion> getCustomersData() {
    return customers.map((customer) => customer.toData() as CustomersTableCompanion).toList();
  }

  List<ScreeningsTableCompanion> getScreeningsData() {
    return screenings.map((screening) => screening.toData()).toList();
  }

  List<ScreeningVenuesTableCompanion> getScreeningVenuesData() {
    return venues.map((venue) => venue.toData()).toList();
  }

  List<ScreeningTimeslotsTableCompanion> getScreeningTimeslotsData() {
    return timeslots.map((timeslot) => timeslot.toData()).toList();
  }

  List<ScreeningRegistrationsTableCompanion> getScreeningRegistrationsData() {
    return registrations.map((registration) => registration.toData()).toList();
  }

  List<OrdersTableCompanion> getOrdersData() {
    return orders.map((order) => order.toData() as OrdersTableCompanion).toList();
  }

  List<OrderItemsTableCompanion> getOrderItemsData() {
    return orderItems.map((item) => item.toData() as OrderItemsTableCompanion).toList();
  }

  List<OrderExtrasTableCompanion> getOrderExtrasData() {
    return orderExtras.map((extra) => extra.toData() as OrderExtrasTableCompanion).toList();
  }

  List<OrderPaymentsTableCompanion> getOrderPaymentsData() {
    return orderPayments.map((payment) => payment.toData() as OrderPaymentsTableCompanion).toList();
  }
}
