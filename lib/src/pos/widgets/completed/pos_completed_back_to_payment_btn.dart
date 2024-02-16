import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hop_pos/app/app_colors.dart';
import 'package:hop_pos/app/app_styles.dart';
import 'package:hop_pos/src/pos/controllers/pos_controller.dart';

class PosCompletedBackToPaymentBtn extends ConsumerWidget {
  const PosCompletedBackToPaymentBtn({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        const SizedBox(height: 10),
        SizedBox(
          width: 500,
          child: TextButton(
            style: TextButton.styleFrom(
              backgroundColor: AppColors.gray400,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
            ),
            onPressed: () => ref.read(posControllerProvider.notifier).setPayLater(false),
            child: Text(
              'Back to payment',
              style: AppStyles.bodyLarge.copyWith(
                fontSize: 20,
                color: AppColors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
