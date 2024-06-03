import 'package:hop_pos/src/product_categories/models/product_category.dart';
import 'package:hop_pos/src/product_categories/repositories/product_category_repository.dart';
import 'package:hop_pos/src/product_categories/services/product_categories_hidden.dart';
import 'package:hop_pos/src/product_categories/services/product_categories_order.dart';
import 'package:hop_pos/src/products/models/product_with_category.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'product_category_actions.g.dart';

@riverpod
ProductCategoryActions productCategoryActions(ProductCategoryActionsRef ref) {
  return ProductCategoryActions(
    productCategoryRepo: ref.watch(productCategoryRepoProvider),
  );
}

class ProductCategoryActions {
  final ProductCategoryRepository productCategoryRepo;

  ProductCategoryActions({
    required this.productCategoryRepo,
  });

  Future<List<ProductCategory>> getAllProductCategories({bool showHidden = false}) async {
    const all = ProductCategory(id: 0, name: 'All');
    List<ProductCategory> categories = await productCategoryRepo.getAll();
    categories.insert(0, all);

    categories = await _sortProductCategories(categories);
    categories = await _hideProductCategories(categories, showHidden);

    return categories;
  }

  Future<List<ProductCategory>> _hideProductCategories(List<ProductCategory> categories, bool showHidden) async {
    final List<int>? hiddenIds = await ProductCategoriesHidden.getHiddenCategories();
    categories = categories.map((category) {
      return category.copyWith(isHidden: hiddenIds?.contains(category.id) == true);
    }).toList();

    if (hiddenIds != null && !showHidden) {
      categories.removeWhere((category) => hiddenIds.contains(category.id));
    }

    return categories;
  }

  Future<List<ProductCategory>> _sortProductCategories(List<ProductCategory> categories) async {
    final List<int>? sortedIds = await ProductCategoriesOrder.getCategoriesOrder();

    if (sortedIds == null) {
      await ProductCategoriesOrder.setCategoriesOrder(categories);
      return categories;
    }

    return categories
      ..sort((a, b) {
        int indexA = sortedIds.indexOf(a.id);
        int indexB = sortedIds.indexOf(b.id);

        if (indexA == -1) indexA = categories.length + 1;
        if (indexB == -1) indexB = categories.length + 1;

        return indexA.compareTo(indexB);
      });
  }

  Future<void> reorderProductCategories(int oldIndex, int newIndex) async {
    await ProductCategoriesOrder.reorderCategories(oldIndex, newIndex);
  }

  Future<void> toggleProductCategory(ProductCategory category) async {
    await ProductCategoriesHidden.toggleCategory(category);
  }

  Future<void> sortProductCategoriesAlphabetically(List<ProductCategory> categories) async {
    categories.sort((a, b) {
      return a.name.compareTo(b.name);
    });

    await ProductCategoriesOrder.setCategoriesOrder(categories);
  }

  Future<void> toggleAllProductCategories(List<ProductCategory> categories) async {
    final isAllHidden = categories.where((cat) => !cat.isHidden && cat.id != 0).isEmpty;
    await ProductCategoriesHidden.toggleAllCategories(categories, hideAll: !isAllHidden);
  }

  Future<bool> deleteById(int id) async {
    return productCategoryRepo.deleteById(id);
  }

  Future<List<ProductWithCategory>> search(String search) async {
    return productCategoryRepo.search(search);
  }
}
