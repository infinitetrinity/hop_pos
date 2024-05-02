import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hop_pos/app/app_colors.dart';
import 'package:hop_pos/app/app_extension.dart';
import 'package:hop_pos/app/app_styles.dart';
import 'package:hop_pos/src/pos/controllers/pos_controller.dart';
import 'package:hop_pos/src/pos/widgets/completed/pos_completed_print_receipt_btn.dart';
import 'package:hop_pos/src/pos/widgets/completed/pos_completed_print_utf_stf_btn.dart';

class PosCompletedHeader extends ConsumerWidget {
  const PosCompletedHeader({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final totalPayment = ref.watch(posControllerProvider.select((prov) => prov.order?.totalPayment ?? 0));
    final balance = ref.watch(posControllerProvider.select((prov) => prov.order?.balance ?? 0));
    final change = ref.watch(posControllerProvider.select((prov) => prov.order?.change ?? 0));
    final isUtfOrStf = ref.watch(posControllerProvider.select((prov) => prov.order?.isStfOrUtf ?? false));

    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          balance > 0
              ? Text(
                  'Payment Incomplete',
                  style: AppStyles.bodyLarge.copyWith(
                    color: AppColors.red600,
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                  ),
                )
              : Text(
                  'Payment Received',
                  style: AppStyles.bodyLarge.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                  ),
                ),
          const SizedBox(height: 10),
          if (change > 0) ...[
            Text(
              'Return ${change.formatMoney} change',
              style: AppStyles.bodyLarge.copyWith(
                fontSize: 22,
                color: AppColors.green700,
              ),
            ),
            const SizedBox(height: 10),
          ],
          Text(
            'Received ${totalPayment.formatMoney}',
            style: AppStyles.bodyLarge.copyWith(
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const PosCompletedPrintReceiptBtn(),
              if (isUtfOrStf) ...[
                const SizedBox(width: 10),
                const PosCompletedPrintUtfStfBtn(),
              ]
            ],
          )
        ],
      ),
    );
  }
}
