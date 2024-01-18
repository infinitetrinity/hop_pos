import 'package:hop_pos/src/product_categories/models/product_category.dart';
import 'package:hop_pos/src/product_categories/repositories/product_category_repository.dart';
import 'package:hop_pos/src/product_categories/services/product_categories_order.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'product_category_controller.g.dart';

@riverpod
class ProductCategoryController extends _$ProductCategoryController {
  @override
  Future<List<ProductCategory>> build() {
    return _getAllProductCategories();
  }

  Future<List<ProductCategory>> _getAllProductCategories() async {
    ProductCategoryRepository repo = ref.watch(productCategoryRepoProvider);
    const all = ProductCategory(id: 0, name: 'All');
    final categories = await repo.getAll();
    categories.insert(0, all);

    final List<int>? sortedIds = await ProductCategoriesOrder.getCategoriesOrder();
    if (sortedIds != null) {
      print('sorting');
      categories.sort((a, b) {
        int indexA = sortedIds.indexOf(a.id);
        int indexB = sortedIds.indexOf(b.id);

        if (indexA == -1) indexA = categories.length + 1;
        if (indexB == -1) indexB = categories.length + 1;

        return indexA.compareTo(indexB);
      });
    }

    return categories;
  }

  Future<void> reorderProductCategories(int oldIndex, int newIndex) async {
    List<ProductCategory>? categories = state.asData?.value;
    if (categories == null) {
      return;
    }

    List<ProductCategory> reOrderedCategories = List.from(categories);
    ProductCategory itemToMove = reOrderedCategories.removeAt(oldIndex);
    reOrderedCategories.insert(newIndex, itemToMove);
    state = AsyncData(reOrderedCategories);

    await ProductCategoriesOrder.setCategoriesOrder(reOrderedCategories);
  }
}
