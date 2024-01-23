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

    if (selectedCategory == null) {
      const utf = Product(id: 0, name: 'Urine to follow', sku: 'UTF', price: 0);
      const stf = Product(id: 0, name: 'Stool to follow', sku: 'STF', price: 0);
      const customProduct = Product(id: 0, name: 'Custom Product', sku: 'Custom', price: 0);
      products.insert(0, stf);
      products.insert(0, utf);
      products.insert(0, customProduct);
    }

    return partition<Product>(products, 16).toList();
  }

  void selectProduct(Product product) {
    ref.read(selectedProductStateProvider.notifier).set(product);
  }
}
