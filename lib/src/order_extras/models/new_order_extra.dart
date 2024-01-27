import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hop_pos/src/common/converters/double_from_string_converter.dart';

part 'new_order_extra.freezed.dart';
part 'new_order_extra.g.dart';

@freezed
class NewOrderExtra with _$NewOrderExtra {
  const factory NewOrderExtra({
    required int id,
    required String name,
    required String type,
    String? description,
    @DoubleFromStringConverter() double? amount,
    @JsonKey(name: 'amount_type') required String amountType,
    @DoubleFromStringConverter() @JsonKey(name: 'calculated_amount') double? calculatedAmount,
    @JsonKey(name: 'extra_id') int? extraId,
    @JsonKey(name: 'order_id') required int orderId,
    @JsonKey(name: 'order_is_new') required bool orderIsNew,
    @JsonKey(name: 'created_at') required DateTime createdAt,
  }) = _NewOrderExtra;

  factory NewOrderExtra.fromJson(Map<String, dynamic> json) => _$NewOrderExtraFromJson(json);
}
