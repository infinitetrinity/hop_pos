import 'package:hop_pos/src/product_categories/models/product_category.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'selected_product_category_state.g.dart';

@riverpod
class SelectedProductCategoryState extends _$SelectedProductCategoryState {
  @override
  ProductCategory? build() {
    return null;
  }

  void set(ProductCategory? category) {
    state = category;
  }
}
