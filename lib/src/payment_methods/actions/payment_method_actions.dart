import 'package:hop_pos/src/payment_methods/models/payment_method.dart';
import 'package:hop_pos/src/payment_methods/repositories/payment_method_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'payment_method_actions.g.dart';

@riverpod
PaymentMethodActions paymentMethodActions(PaymentMethodActionsRef ref) {
  return PaymentMethodActions(
    paymentMethodRepo: ref.watch(paymentMethodRepoProvider),
  );
}

class PaymentMethodActions {
  final PaymentMethodRepository paymentMethodRepo;

  PaymentMethodActions({
    required this.paymentMethodRepo,
  });

  Future<PaymentMethod> getPaymentMethodById(int id) async {
    return await paymentMethodRepo.getById(id);
  }
}
