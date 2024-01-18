import 'package:hop_pos/src/products/models/product.dart';
import 'package:hop_pos/src/products/models/product_with_category.dart';
import 'package:hop_pos/src/products/repositories/product_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'products_search_state.g.dart';

@riverpod
Future<List<ProductWithCategory>> productsSearchState(ProductsSearchStateRef ref, String search) {
  final repo = ref.watch(productRepoProvider);
  return repo.search(search);
}
