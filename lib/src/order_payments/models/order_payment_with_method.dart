import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hop_pos/src/order_payments/models/order_payment.dart';
import 'package:hop_pos/src/payment_methods/models/payment_method.dart';

part 'order_payment_with_method.freezed.dart';
part 'order_payment_with_method.g.dart';

@freezed
class OrderPaymentWithMethod with _$OrderPaymentWithMethod {
  const factory OrderPaymentWithMethod({
    required OrderPayment payment,
    PaymentMethod? method,
  }) = _OrderPaymentWithMethod;

  const OrderPaymentWithMethod._();

  factory OrderPaymentWithMethod.fromJson(Map<String, dynamic> json) => _$OrderPaymentWithMethodFromJson(json);
}
