import 'package:hop_pos/src/product_categories/actions/product_category_actions.dart';
import 'package:hop_pos/src/products/actions/product_actions.dart';
import 'package:hop_pos/src/products/models/product_with_category.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'products_search_state.g.dart';

@riverpod
Future<List<ProductWithCategory>> productsSearchState(ProductsSearchStateRef ref, String search) async {
  final productActions = ref.watch(productActionsProvider);
  final categoryActions = ref.watch(productCategoryActionsProvider);

  final products = await productActions.search(search);
  final categories = await categoryActions.search(search);

  return [...products, ...categories]..sort((a, b) {
      final aName = (a.product?.name ?? a.category?.name) ?? '';
      final bName = (b.product?.name ?? b.category?.name) ?? '';

      return aName.compareTo(bName);
    });
}
