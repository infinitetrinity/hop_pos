import 'package:freezed_annotation/freezed_annotation.dart';

part 'product.freezed.dart';

@freezed
class Product with _$Product {
  const factory Product({
    required int id,
    required String name,
    required String sku,
    required double price,
    String? description,
    @JsonKey(name: 'color_code') String? colorCode,
    @JsonKey(name: 'category_id') int? categoryId,
  }) = _Product;

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      sku: json['sku'],
      price: double.tryParse(json['price']) ?? 0,
      description: json['description'],
      colorCode: json['color_code'],
      categoryId: json['category_id'],
    );
  }

  static List<Product> fromJsonList(dynamic data) {
    return List<Product>.from(
      data.map((el) => Product.fromJson(el)),
    );
  }

  static String get table {
    return 'products';
  }
}
