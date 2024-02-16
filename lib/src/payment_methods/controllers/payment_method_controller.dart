import 'package:hop_pos/src/payment_methods/actions/payment_method_actions.dart';
import 'package:hop_pos/src/payment_methods/models/payment_method.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'payment_method_controller.g.dart';

@riverpod
class PaymentMethodController extends _$PaymentMethodController {
  @override
  Future<List<PaymentMethod>> build() async {
    final methods = await _getAllPaymentMethods();
    methods.add(const PaymentMethod(id: 0, name: 'Pay Later'));

    return methods;
  }

  Future<List<PaymentMethod>> _getAllPaymentMethods() async {
    return await ref.read(paymentMethodActionsProvider).getAllPaymentMethods();
  }

  Future<PaymentMethod> getPaymentMethodById(int id) async {
    return await ref.read(paymentMethodActionsProvider).getPaymentMethodById(id);
  }
}
