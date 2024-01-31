import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hop_pos/src/common/converters/double_from_string_converter.dart';

part 'order_extra.freezed.dart';
part 'order_extra.g.dart';

@freezed
class OrderExtra with _$OrderExtra {
  const factory OrderExtra({
    required int id,
    required String name,
    required String type,
    String? description,
    @DoubleFromStringConverter() double? amount,
    @JsonKey(name: 'amount_type') required String amountType,
    @DoubleFromStringConverter() @JsonKey(name: 'calculated_amount') double? calculatedAmount,
    @JsonKey(name: 'extra_id') int? extraId,
    @JsonKey(name: 'order_id') required int orderId,
    @Default(false) @JsonKey(name: 'order_is_new') bool? orderIsNew,
    @Default(false) @JsonKey(name: 'is_new') bool? isNew,
    @JsonKey(name: 'created_at') DateTime? createdAt,
  }) = _OrderExtra;

  factory OrderExtra.fromJson(Map<String, dynamic> json) => _$OrderExtraFromJson(json);

  static List<OrderExtra> fromJsonList(dynamic data) {
    return List<OrderExtra>.from(
      data.map((el) => OrderExtra.fromJson(el)),
    );
  }
}
