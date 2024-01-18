import 'package:hop_pos/src/product_categories/states/selected_product_category_state.dart';
import 'package:hop_pos/src/products/models/product.dart';
import 'package:hop_pos/src/products/repositories/product_repository.dart';
import 'package:hop_pos/src/products/states/selected_product_state.dart';
import 'package:quiver/iterables.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'products_controller.g.dart';

@riverpod
class ProductsController extends _$ProductsController {
  @override
  Future<List<List<Product>>> build() {
    return _getAllProducts();
  }

  Future<List<List<Product>>> _getAllProducts() async {
    ProductRepository repo = ref.watch(productRepoProvider);
    final selectedCategory = ref.watch(selectedProductCategoryStateProvider);
    final products = await repo.getAll(categoryId: selectedCategory?.id);

    return partition<Product>(products, 20).toList();
  }

  void selectProduct(Product product) {
    ref.read(selectedProductStateProvider.notifier).set(product);
  }
}
