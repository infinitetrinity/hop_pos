import 'package:drift/drift.dart' as drift;
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hop_pos/app/app_db.dart';

part 'product_category.freezed.dart';
part 'product_category.g.dart';

@freezed
class ProductCategory with _$ProductCategory {
  const factory ProductCategory({
    required int id,
    required String name,
    String? description,
    @JsonKey(name: 'color_code') String? colorCode,
    @Default(false) bool isHidden,
  }) = _ProductCategory;

  const ProductCategory._();

  factory ProductCategory.fromJson(Map<String, dynamic> json) => _$ProductCategoryFromJson(json);

  static List<ProductCategory> fromJsonList(dynamic data) {
    return List<ProductCategory>.from(
      data.map((el) => ProductCategory.fromJson(el)),
    );
  }

  ProductCategoriesTableCompanion toData() {
    return ProductCategoriesTableCompanion(
      id: drift.Value(id),
      name: drift.Value(name),
      description: drift.Value(description),
      colorCode: drift.Value(colorCode),
    );
  }
}
