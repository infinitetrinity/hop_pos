import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hop_pos/app/app_extension.dart';
import 'package:hop_pos/src/common/converters/bool_from_int_converter.dart';
import 'package:hop_pos/src/common/converters/double_from_string_converter.dart';

part 'order_item.freezed.dart';
part 'order_item.g.dart';

@freezed
class OrderItem with _$OrderItem {
  const factory OrderItem({
    required int id,
    required String name,
    required String sku,
    String? description,
    @DoubleFromStringConverter() double? price,
    @DoubleFromStringConverter() double? discount,
    @JsonKey(name: 'discount_type') String? discountType,
    @DoubleFromStringConverter() @JsonKey(name: 'net_price') double? netPrice,
    @BoolFromIntConverter() @JsonKey(name: 'is_custom') required bool isCustom,
    @Default(false) @JsonKey(name: 'order_is_new') bool? orderIsNew,
    @JsonKey(name: 'cart_id') int? cartId,
    @JsonKey(name: 'product_id') int? productId,
    @JsonKey(name: 'order_id') required int orderId,
    @Default(false) @JsonKey(name: 'is_new') bool? isNew,
    @JsonKey(name: 'created_at') DateTime? createdAt,
  }) = _OrderItem;

  const OrderItem._();

  factory OrderItem.fromJson(Map<String, dynamic> json) => _$OrderItemFromJson(json);

  static List<OrderItem> fromJsonList(dynamic data) {
    return List<OrderItem>.from(
      data.map((el) => OrderItem.fromJson(el)),
    );
  }

  String get displayPrice {
    return price == null ? 0.0.formatMoney : price!.formatMoney;
  }
}
