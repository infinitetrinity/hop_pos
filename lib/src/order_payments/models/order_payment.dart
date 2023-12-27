import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_payment.freezed.dart';

@freezed
class OrderPayment with _$OrderPayment {
  const factory OrderPayment({
    required int id,
    required double amount,
    @JsonKey(name: 'order_id') required int orderId,
    @JsonKey(name: 'payment_method_id') int? paymentMethodId,
    required DateTime createdAt,
  }) = _OrderPayment;

  factory OrderPayment.fromJson(Map<String, dynamic> json) {
    return OrderPayment(
      id: json['id'],
      amount: double.tryParse(json['amount']) ?? 0,
      orderId: json['order_id'],
      paymentMethodId: json['payment_method_id'],
      createdAt: DateTime.parse(json['created_at']),
    );
  }

  static List<OrderPayment> fromJsonList(dynamic data) {
    return List<OrderPayment>.from(
      data.map((el) => OrderPayment.fromJson(el)),
    );
  }

  static String get table {
    return 'order_payments';
  }
}
