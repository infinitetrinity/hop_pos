import 'package:hop_pos/src/payment_methods/actions/payment_method_actions.dart';
import 'package:hop_pos/src/payment_methods/models/payment_method.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'payment_method_controller.g.dart';

@riverpod
class PaymentMethodController extends _$PaymentMethodController {
  @override
  void build() {
    return;
  }

  Future<PaymentMethod> getPaymentMethodById(int id) async {
    return await ref.read(paymentMethodActionsProvider).getPaymentMethodById(id);
  }
}
