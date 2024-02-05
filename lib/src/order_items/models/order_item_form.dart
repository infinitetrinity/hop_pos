import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hop_pos/app/app_extension.dart';
import 'package:hop_pos/src/order_items/models/order_item.dart';
import 'package:hop_pos/src/orders/models/order.dart';

part 'order_item_form.freezed.dart';
part 'order_item_form.g.dart';

@freezed
class OrderItemForm with _$OrderItemForm {
  const factory OrderItemForm({
    int? id,
    String? name,
    String? sku,
    double? price,
    String? description,
    double? discount,
    @JsonKey(name: 'discount_type') @Default(DiscountType.percentage) DiscountType? discountType,
    @JsonKey(name: 'is_custom') @Default(false) bool isCustom,
    @Default(false) @JsonKey(name: 'order_is_new') bool? orderIsNew,
    @JsonKey(name: 'cart_id') int? cartId,
    @JsonKey(name: 'product_id') int? productId,
    @JsonKey(name: 'order_id') int? orderId,
    @Default(false) @JsonKey(name: 'is_new') bool? isNew,
  }) = _OrderItemForm;

  const OrderItemForm._();

  factory OrderItemForm.fromJson(Map<String, dynamic> json) => _$OrderItemFormFromJson(json);

  static OrderItemForm fromModel(OrderItem item) {
    return OrderItemForm.fromJson(item.toJson());
  }

  bool get isPercentageDiscount {
    return discountType == DiscountType.percentage;
  }

  String? validateName() {
    if (name.isNullOrEmpty) {
      return "Product name is required";
    }

    return null;
  }

  String? validateSku() {
    if (isCustom && sku.isNullOrEmpty) {
      return "Product SKU is required";
    }

    return null;
  }

  String? validatePrice() {
    if (price == null) {
      return "Product price is required";
    }

    if (price! < 0) {
      return "Product price must be a positive value.";
    }

    return null;
  }

  String? validateDiscount() {
    if (discount == null || discount == 0) {
      return null;
    }

    if (discount! < 0) {
      return "Discount must be a positive value.";
    }

    if (isPercentageDiscount && discount! > 100) {
      return "Discount must be equal to or lower than 100%.";
    }

    if (!isPercentageDiscount && discount! > (price ?? 0)) {
      return "Discount must be equal to or lower than product price.";
    }

    return null;
  }
}
