import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hop_pos/app/app_colors.dart';
import 'package:hop_pos/src/common/widgets/layout.dart';
import 'package:hop_pos/src/pos/controllers/pos_controller.dart';
import 'package:hop_pos/src/pos/widgets/checkout/pos_checkout.dart';
import 'package:hop_pos/src/pos/widgets/completed/pos_completed.dart';
import 'package:hop_pos/src/pos/widgets/pos_payment_header.dart';
import 'package:hop_pos/src/pos/widgets/sales_summary/pos_sales_summary.dart';

class PosPaymentScreen extends ConsumerWidget {
  const PosPaymentScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isCompleted =
        ref.watch(posControllerProvider.select((prov) => (prov.order?.isFullyPaid ?? prov.order?.payLater) ?? false));

    return Layout(
      Column(
        children: [
          const PosPaymentHeader(),
          const SizedBox(height: 15),
          Container(
            color: AppColors.white,
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const PosSalesSummary(),
                isCompleted ? const PosCompleted() : const PosCheckout(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
