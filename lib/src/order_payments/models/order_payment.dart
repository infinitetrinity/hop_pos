import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hop_pos/src/common/converters/double_from_string_converter.dart';
import 'package:intl/intl.dart';

part 'order_payment.freezed.dart';
part 'order_payment.g.dart';

@freezed
class OrderPayment with _$OrderPayment {
  const factory OrderPayment({
    required int id,
    @DoubleFromStringConverter() double? amount,
    @JsonKey(name: 'order_id') required int orderId,
    @JsonKey(name: 'payment_method_id') int? paymentMethodId,
    @Default(false) @JsonKey(name: 'order_is_new') bool? orderIsNew,
    @Default(false) @JsonKey(name: 'is_new') bool? isNew,
    @JsonKey(name: 'created_at') required DateTime createdAt,
  }) = _OrderPayment;

  const OrderPayment._();

  factory OrderPayment.fromJson(Map<String, dynamic> json) => _$OrderPaymentFromJson(json);

  static List<OrderPayment> fromJsonList(dynamic data) {
    return List<OrderPayment>.from(
      data.map((el) => OrderPayment.fromJson(el)),
    );
  }

  String get displayCreatedAt {
    return DateFormat('dd MMM yyyy, hh:mm a').format(createdAt);
  }
}
