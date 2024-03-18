import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'customer_barcode_state.g.dart';

@riverpod
class CustomerBarcodeState extends _$CustomerBarcodeState {
  @override
  String? build() {
    return null;
  }

  Future<void> set(String barcode) async {
    state = barcode;
  }
}
