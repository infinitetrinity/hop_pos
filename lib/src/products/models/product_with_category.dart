import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hop_pos/src/product_categories/models/product_category.dart';
import 'package:hop_pos/src/products/models/product.dart';

part 'product_with_category.freezed.dart';

@freezed
class ProductWithCategory with _$ProductWithCategory {
  const factory ProductWithCategory({
    required Product product,
    required ProductCategory? category,
  }) = _ProductWithCategory;
}
