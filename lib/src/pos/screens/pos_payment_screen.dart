import 'package:flutter/material.dart';
import 'package:hop_pos/app/app_colors.dart';
import 'package:hop_pos/src/common/widgets/layout.dart';
import 'package:hop_pos/src/pos/widgets/pos_payment_header.dart';
import 'package:hop_pos/src/pos/widgets/sales_summary/pos_sales_summary.dart';

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
            padding: const EdgeInsets.all(20),
            height: 700,
            child: const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PosSalesSummary(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
