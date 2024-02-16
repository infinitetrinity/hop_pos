import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hop_pos/src/payment_methods/controllers/payment_method_controller.dart';
import 'package:hop_pos/src/pos/widgets/checkout/pos_checkout_payment_method_grid.dart';

class PosCheckoutPaymentMethodsList extends ConsumerWidget {
  const PosCheckoutPaymentMethodsList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final paymentMethods = ref.watch(paymentMethodControllerProvider);

    return paymentMethods.when(
      data: (methods) => Container(
        height: 330,
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: GridView.builder(
          shrinkWrap: true,
          physics: const AlwaysScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            childAspectRatio: 3.5,
          ),
          itemCount: methods.length,
          itemBuilder: (context, index) => PosCheckoutPaymentMethodGrid(method: methods[index]),
        ),
      ),
      error: (err, stack) => Container(),
      loading: () => Container(),
    );
  }
}
