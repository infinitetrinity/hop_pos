import 'package:hop_pos/src/product_categories/models/product_category.dart';
import 'package:hop_pos/src/product_categories/repositories/product_category_repository.dart';
import 'package:hop_pos/src/product_categories/services/product_categories_hidden.dart';
import 'package:hop_pos/src/product_categories/services/product_categories_order.dart';
import 'package:hop_pos/src/product_categories/states/selected_product_category_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'product_category_controller.g.dart';

@riverpod
class ProductCategoryController extends _$ProductCategoryController {
  @override
  Future<List<ProductCategory>> build({bool showHidden = false}) {
    return _getAllProductCategories(showHidden: showHidden);
  }

  Future<List<ProductCategory>> _getAllProductCategories({bool showHidden = false}) async {
    ProductCategoryRepository repo = ref.watch(productCategoryRepoProvider);
    const all = ProductCategory(id: 0, name: 'All');
    List<ProductCategory> categories = await repo.getAll();
    categories.insert(0, all);

    final List<int>? hiddenIds = await ProductCategoriesHidden.getHiddenCategories();
    categories = categories.map((category) {
      return category.copyWith(isHidden: hiddenIds?.contains(category.id) == true);
    }).toList();

    if (hiddenIds != null && !showHidden) {
      categories.removeWhere((category) => hiddenIds.contains(category.id));
    }

    final List<int>? sortedIds = await ProductCategoriesOrder.getCategoriesOrder();
    if (sortedIds != null) {
      categories.sort((a, b) {
        int indexA = sortedIds.indexOf(a.id);
        int indexB = sortedIds.indexOf(b.id);

        if (indexA == -1) indexA = categories.length + 1;
        if (indexB == -1) indexB = categories.length + 1;

        return indexA.compareTo(indexB);
      });
    }

    selectProductCategory(categories.firstWhere((el) => !el.isHidden));
    return categories;
  }

  Future<void> reorderProductCategories(int oldIndex, int newIndex) async {
    await ProductCategoriesOrder.reorderCategories(oldIndex, newIndex);
    ref.invalidateSelf();
  }

  Future<void> toggleProductCategory(ProductCategory category) async {
    await ProductCategoriesHidden.toggleCategory(category);
    ref.invalidateSelf();
  }

  void selectProductCategory(ProductCategory category) {
    ref.read(selectedProductCategoryStateProvider.notifier).set(category.id == 0 ? null : category);
  }
}
