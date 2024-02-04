import 'package:hop_pos/src/products/actions/product_actions.dart';
import 'package:hop_pos/src/products/models/product.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'products_controller.g.dart';

@riverpod
class ProductsController extends _$ProductsController {
  @override
  Future<List<List<Product>>> build() {
    return ref.watch(productActionsProvider).getAllProducts(partitionSize: 16).then((dynamic result) {
      return result as List<List<Product>>;
    });
  }
}
