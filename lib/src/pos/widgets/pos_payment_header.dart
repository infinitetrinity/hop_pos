import 'package:flutter/material.dart';
import 'package:hop_pos/src/pos/widgets/pos_payment_back_btn.dart';

class PosPaymentHeader extends StatelessWidget {
  const PosPaymentHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        PosPaymentBackBtn(),
      ],
    );
  }
}
