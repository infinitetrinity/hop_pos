import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'to_reorder_product_category_state.g.dart';

@riverpod
class ToReorderProductCategoryState extends _$ToReorderProductCategoryState {
  @override
  bool build() {
    return false;
  }

  void toggle() {
    state = !state;
  }
}
