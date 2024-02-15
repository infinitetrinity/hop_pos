import 'package:flutter/material.dart';
import 'package:hop_pos/app/app_colors.dart';
import 'package:hop_pos/src/common/widgets/layout.dart';
import 'package:hop_pos/src/pos/widgets/pos_payment_header.dart';

class PosPaymentScreen extends StatelessWidget {
  const PosPaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Layout(
      Column(
        children: [
          const PosPaymentHeader(),
          const SizedBox(height: 15),
          Container(
            color: AppColors.white,
            width: double.infinity,
            height: 600,
            child: const Row(
              children: [],
            ),
          )
        ],
      ),
    );
  }
}
