import 'package:flutter/material.dart';
import 'package:hop_pos/src/pos/widgets/checkout/pos_checkout_input.dart';
import 'package:hop_pos/src/pos/widgets/checkout/pos_checkout_payment_methods_list.dart';

class PosCheckout extends StatelessWidget {
  const PosCheckout({super.key});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        padding: const EdgeInsets.only(left: 12),
        child: const Column(
          children: [
            PosCheckoutInput(),
            PosCheckoutPaymentMethodsList(),
          ],
        ),
      ),
    );
  }
}
