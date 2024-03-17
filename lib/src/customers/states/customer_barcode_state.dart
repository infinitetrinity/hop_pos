import 'package:hop_pos/app/app_extension.dart';
import 'package:hop_pos/src/customers/actions/customer_actions.dart';
import 'package:hop_pos/src/customers/models/customer_with_screenings_and_orders.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'customer_barcode_state.g.dart';

@riverpod
class CustomerBarcodeState extends _$CustomerBarcodeState {
  @override
  CustomerWithScreeningsAndOrders? build() {
    return null;
  }

  Future<bool> set(String? barcode) async {
    state = null;

    if (!barcode.isNullOrEmpty) {
      state = await ref.read(customerActionsProvider).findCustomerDetail(barcode!);
      return state != null;
    }

    return false;
  }
}
