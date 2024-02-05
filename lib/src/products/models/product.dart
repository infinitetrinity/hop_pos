import 'package:drift/drift.dart' as drift;
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hop_pos/app/app_db.dart';
import 'package:hop_pos/app/app_extension.dart';
import 'package:hop_pos/src/order_items/models/order_item.dart';
import 'package:hop_pos/src/orders/models/order.dart';

part 'product.freezed.dart';
part 'product.g.dart';

@freezed
class Product with _$Product {
  const factory Product({
    int? id,
    required String name,
    String? sku,
    double? price,
    String? description,
    double? discount,
    @JsonKey(name: 'discount_type') DiscountType? discountType,
    @JsonKey(name: 'color_code') String? colorCode,
    @JsonKey(name: 'category_id') int? categoryId,
    @JsonKey(name: 'is_new') @Default(false) bool isNew,
    @JsonKey(name: 'is_custom') @Default(false) bool isCustom,
  }) = _Product;

  const Product._();

  factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);

  static List<Product> fromJsonList(dynamic data) {
    return List<Product>.from(
      data.map((el) => Product.fromJson(el)),
    );
  }

  ProductsTableCompanion toData() {
    return ProductsTableCompanion(
      id: drift.Value.ofNullable(id),
      name: drift.Value(name),
      sku: drift.Value.ofNullable(sku),
      price: drift.Value(price ?? 0),
      description: drift.Value(description),
      colorCode: drift.Value(colorCode),
      categoryId: drift.Value(categoryId),
    );
  }

  OrderItem toOrderItem() {
    return OrderItem(
      name: name,
      sku: sku ?? '',
      price: price,
      description: description,
      discount: discount,
      discountType: discountType,
      netPrice: netPrice,
      isNew: true,
      isCustom: isCustom,
      productId: id,
    );
  }

  bool get isPercentageDiscount {
    return discountType == DiscountType.percentage;
  }

  double get calculatedDiscount {
    return isPercentageDiscount ? (price ?? 0).percentageOf(discount ?? 0).toDecimalPlace(2) : discount ?? 0;
  }

  double get netPrice {
    return (price ?? 0) - calculatedDiscount;
  }
}
