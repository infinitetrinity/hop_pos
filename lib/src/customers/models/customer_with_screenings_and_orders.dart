import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hop_pos/src/customers/models/customer.dart';
import 'package:hop_pos/src/customers/models/customer_with_registration.dart';
import 'package:hop_pos/src/orders/models/order_with_customer_and_payment.dart';

part 'customer_with_screenings_and_orders.freezed.dart';
part 'customer_with_screenings_and_orders.g.dart';

@freezed
class CustomerWithScreeningsAndOrders with _$CustomerWithScreeningsAndOrders {
  const factory CustomerWithScreeningsAndOrders({
    required Customer customer,
    List<CustomerWithRegistration>? screenings,
    List<OrderWithCustomerAndPayment>? orders,
  }) = _CustomerWithScreeningsAndOrders;

  const CustomerWithScreeningsAndOrders._();

  factory CustomerWithScreeningsAndOrders.fromJson(Map<String, dynamic> json) =>
      _$CustomerWithScreeningsAndOrdersFromJson(json);
}
