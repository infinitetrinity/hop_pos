import 'package:hop_pos/src/product_categories/states/selected_product_category_state.dart';
import 'package:hop_pos/src/products/models/product.dart';
import 'package:hop_pos/src/products/repositories/product_repository.dart';
import 'package:quiver/iterables.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'product_actions.g.dart';

@riverpod
class ProductActions extends _$ProductActions {
  @override
  void build() {
    return;
  }

  Future<dynamic> getAllProducts({int partitionSize = 0}) async {
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

    return partitionSize > 0 ? partition<Product>(products, partitionSize).toList() : products;
  }
}