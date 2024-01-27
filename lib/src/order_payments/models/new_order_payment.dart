import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hop_pos/src/common/converters/double_from_string_converter.dart';

part 'new_order_payment.freezed.dart';
part 'new_order_payment.g.dart';

@freezed
class NewOrderPayment with _$NewOrderPayment {
  const factory NewOrderPayment({
    required int id,
    @DoubleFromStringConverter() double? amount,
    @JsonKey(name: 'order_id') required int orderId,
    @JsonKey(name: 'payment_method_id') int? paymentMethodId,
    @JsonKey(name: 'order_is_new') required bool orderIsNew,
    @JsonKey(name: 'created_at') required DateTime createdAt,
  }) = _NewOrderPayment;

  factory NewOrderPayment.fromJson(Map<String, dynamic> json) => _$NewOrderPaymentFromJson(json);
}
