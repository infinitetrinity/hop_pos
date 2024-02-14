import 'package:hop_pos/src/product_categories/controllers/product_category_controller.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'is_all_product_categories_hidden_state.g.dart';

@riverpod
Future<bool> isAllProductCategoriesHiddenState(IsAllProductCategoriesHiddenStateRef ref) async {
  final categories = await ref.read(productCategoryControllerProvider(showHidden: true).future);
  return categories.where((cat) => !cat.isHidden && cat.id != 0).isEmpty;
}
