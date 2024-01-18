import 'package:hop_pos/src/products/models/product.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'selected_product_state.g.dart';

@riverpod
class SelectedProductState extends _$SelectedProductState {
  @override
  Product? build() {
    return null;
  }

  void set(Product product) {
    state = product;
  }
}
