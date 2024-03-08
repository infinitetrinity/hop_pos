import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hop_pos/app/app_extension.dart';
import 'package:hop_pos/src/customers/models/customer.dart';
import 'package:hop_pos/src/orders/models/order.dart';

part 'order_with_customer_and_payment.freezed.dart';
part 'order_with_customer_and_payment.g.dart';

@freezed
class OrderWithCustomerAndPayment with _$OrderWithCustomerAndPayment {
  const factory OrderWithCustomerAndPayment({
    required Order order,
    required Customer customer,
    String? index,
    double? totalPayment,
  }) = _OrderWithCustomerAndPayment;

  const OrderWithCustomerAndPayment._();

  factory OrderWithCustomerAndPayment.fromJson(Map<String, dynamic> json) =>
      _$OrderWithCustomerAndPaymentFromJson(json);

  double get balance {
    final amount = (order.total - (totalPayment ?? 0)).toDecimalPlace(2);
    return amount > 0 ? amount : 0;
  }

  double get change {
    final amount = (order.total - (totalPayment ?? 0)).toDecimalPlace(2);
    return amount > 0 ? 0 : amount.abs();
  }
}
