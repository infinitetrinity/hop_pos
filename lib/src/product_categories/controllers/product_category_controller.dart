import 'package:hop_pos/src/product_categories/actions/product_category_actions.dart';
import 'package:hop_pos/src/product_categories/models/product_category.dart';
import 'package:hop_pos/src/product_categories/states/selected_product_category_state.dart';
import 'package:hop_pos/src/products/controllers/products_controller.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'product_category_controller.g.dart';

@riverpod
class ProductCategoryController extends _$ProductCategoryController {
  @override
  Future<List<ProductCategory>> build({bool showHidden = false}) async {
    final categories = await ref.watch(productCategoryActionsProvider).getAllProductCategories(showHidden: showHidden);
    selectProductCategory(categories.firstWhere((el) => !el.isHidden));
    return categories;
  }

  Future<void> reorderProductCategories(int oldIndex, int newIndex) async {
    await ref.read(productCategoryActionsProvider).reorderProductCategories(oldIndex, newIndex);
  }

  Future<void> toggleProductCategory(ProductCategory category) async {
    await ref.read(productCategoryActionsProvider).toggleProductCategory(category);
  }

  void selectProductCategory(ProductCategory category) {
    ref.read(selectedProductCategoryStateProvider.notifier).set(category.id == 0 ? null : category);
    ref.invalidate(productsControllerProvider);
  }
}
