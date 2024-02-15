import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hop_pos/app/app_colors.dart';
import 'package:hop_pos/app/app_styles.dart';
import 'package:hop_pos/src/pos/controllers/pos_controller.dart';

class PosSalesSummaryHeader extends ConsumerWidget {
  const PosSalesSummaryHeader({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final order = ref.watch(posControllerProvider.select((value) => value.order?.order));

    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: AppColors.gray400,
            width: 5,
          ),
        ),
      ),
      padding: const EdgeInsets.only(bottom: 5),
      child: Text(
        'SALES SUMMARY (${order?.displayInvoiceNo})',
        style: AppStyles.bodyLarge.copyWith(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
