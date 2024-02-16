import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hop_pos/app/app_colors.dart';
import 'package:hop_pos/app/app_styles.dart';
import 'package:hop_pos/src/pos/controllers/pos_controller.dart';

class PosCompletedEReceipt extends ConsumerWidget {
  const PosCompletedEReceipt({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final customer = ref.watch(posControllerProvider.select((prov) => prov.customer));
    final eReceipt = ref.watch(posControllerProvider.select((prov) => prov.order?.order.eReceipt ?? false));

    return eReceipt == false
        ? TextButton(
            onPressed: () => ref.read(posControllerProvider.notifier).setEReceipt(true),
            child: Text(
              'Click here to send e-Receipt',
              style: AppStyles.bodyLarge.copyWith(
                color: AppColors.green700,
                decoration: TextDecoration.underline,
                decorationColor: AppColors.green700,
              ),
            ),
          )
        : Container(
            width: 500,
            decoration: BoxDecoration(
              border: Border.all(
                color: AppColors.gray300,
              ),
            ),
            padding: const EdgeInsets.all(15),
            child: Row(
              children: [
                const Padding(
                  padding: EdgeInsets.only(right: 12),
                  child: Icon(
                    Icons.mail_outline,
                    color: AppColors.gray800,
                    size: 28,
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'This e-receipt will be sent to',
                        style: AppStyles.body.copyWith(
                          color: AppColors.gray800,
                        ),
                      ),
                      Text(
                        customer?.email ?? '',
                        style: AppStyles.body.copyWith(
                          color: AppColors.green700,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: IconButton(
                    onPressed: () => ref.read(posControllerProvider.notifier).setEReceipt(false),
                    icon: const Icon(
                      Icons.cancel,
                      color: AppColors.gray800,
                      size: 28,
                    ),
                  ),
                ),
              ],
            ),
          );
  }
}
