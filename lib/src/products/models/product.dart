import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hop_pos/src/common/converters/double_from_string_converter.dart';
import 'package:hop_pos/src/order_items/models/order_item.dart';

part 'product.freezed.dart';
part 'product.g.dart';

@freezed
class Product with _$Product {
  const factory Product({
    required int id,
    required String name,
    required String sku,
    @DoubleFromStringConverter() double? price,
    String? description,
    @JsonKey(name: 'color_code') String? colorCode,
    @JsonKey(name: 'category_id') int? categoryId,
  }) = _Product;

  const Product._();

  factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);

  static List<Product> fromJsonList(dynamic data) {
    return List<Product>.from(
      data.map((el) => Product.fromJson(el)),
    );
  }

  OrderItem get toOrderItem {
    return OrderItem(
      name: name,
      sku: sku,
      price: price,
      netPrice: price,
      isNew: true,
    );
  }
}
