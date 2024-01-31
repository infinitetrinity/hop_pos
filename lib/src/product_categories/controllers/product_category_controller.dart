import 'package:hop_pos/src/product_categories/actions/product_category_actions.dart';
import 'package:hop_pos/src/product_categories/models/product_category.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'product_category_controller.g.dart';

@riverpod
class ProductCategoryController extends _$ProductCategoryController {
  @override
  Future<List<ProductCategory>> build({bool showHidden = false}) {
    return ref.watch(productCategoryActionsProvider.notifier).getAllProductCategories(showHidden: showHidden);
  }

  Future<void> reorderProductCategories(int oldIndex, int newIndex) async {
    await ref.read(productCategoryActionsProvider.notifier).reorderProductCategories(oldIndex, newIndex);
  }

  Future<void> toggleProductCategory(ProductCategory category) async {
    await ref.read(productCategoryActionsProvider.notifier).toggleProductCategory(category);
  }

  void selectProductCategory(ProductCategory category) {
    ref.read(productCategoryActionsProvider.notifier).selectProductCategory(category);
  }
}
