import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'screening_sales_search_state.g.dart';

@riverpod
class ScreeningSalesSearchState extends _$ScreeningSalesSearchState {
  @override
  String? build() {
    return null;
  }

  void set(String query) {
    state = query;
  }
}
