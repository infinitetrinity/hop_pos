import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hop_pos/src/common/converters/double_from_string_converter.dart';

part 'new_order_item.freezed.dart';
part 'new_order_item.g.dart';

@freezed
class NewOrderItem with _$NewOrderItem {
  const factory NewOrderItem({
    required int id,
    required String name,
    required String sku,
    String? description,
    @DoubleFromStringConverter() double? price,
    @DoubleFromStringConverter() double? discount,
    @JsonKey(name: 'discount_type') String? discountType,
    @DoubleFromStringConverter() @JsonKey(name: 'net_price') double? netPrice,
    @JsonKey(name: 'is_custom') required bool isCustom,
    @JsonKey(name: 'order_is_new') required bool orderIsNew,
    @JsonKey(name: 'cart_id') int? cartId,
    @JsonKey(name: 'product_id') int? productId,
    @JsonKey(name: 'order_id') required int orderId,
    @JsonKey(name: 'created_at') required DateTime createdAt,
  }) = _NewOrderItem;

  factory NewOrderItem.fromJson(Map<String, dynamic> json) => _$NewOrderItemFromJson(json);
}
