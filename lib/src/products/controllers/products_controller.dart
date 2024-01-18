import 'package:hop_pos/src/products/models/product.dart';
import 'package:hop_pos/src/products/models/product_with_category.dart';
import 'package:hop_pos/src/products/repositories/product_repository.dart';
import 'package:hop_pos/src/products/states/selected_product_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'products_controller.g.dart';

@riverpod
class ProductsController extends _$ProductsController {
  @override
  Future<List<ProductWithCategory>> build() {
    return _getAllProductsWithCategory();
  }

  Future<List<ProductWithCategory>> _getAllProductsWithCategory() {
    ProductRepository repo = ref.watch(productRepoProvider);
    return repo.getAllWithCategory();
  }

  void selectProduct(Product product) {
    ref.read(selectedProductStateProvider.notifier).set(product);
  }
}
