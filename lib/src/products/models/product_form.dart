import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hop_pos/app/app_extension.dart';
import 'package:hop_pos/src/orders/models/order.dart';
import 'package:hop_pos/src/products/models/product.dart';

part 'product_form.freezed.dart';
part 'product_form.g.dart';

@freezed
class ProductForm with _$ProductForm {
  const ProductForm._();

  const factory ProductForm({
    int? id,
    String? name,
    String? sku,
    double? price,
    double? discount,
    DiscountType? discountType,
    String? description,
    @JsonKey(name: 'is_new') @Default(false) bool isNew,
  }) = _ProductForm;

  factory ProductForm.fromJson(Map<String, dynamic> json) => _$ProductFormFromJson(json);

  static ProductForm fromModel(Product product) {
    return ProductForm.fromJson(product.toJson());
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
    if (isNew && sku.isNullOrEmpty) {
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
