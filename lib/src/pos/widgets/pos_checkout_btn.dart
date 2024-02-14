import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hop_pos/app/app_colors.dart';
import 'package:hop_pos/app/app_extension.dart';
import 'package:hop_pos/app/app_styles.dart';
import 'package:hop_pos/src/pos/controllers/pos_controller.dart';

class PosCheckoutBtn extends ConsumerWidget {
  const PosCheckoutBtn({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final balance = ref.watch(posControllerProvider.select((prov) => prov.order?.balance ?? 0));
    final canCheckout =
        ref.watch(posControllerProvider.select((prov) => prov.order != null && (prov.order?.items?.length ?? 0) > 0));

    Future<void> onCheckout() async {
      await ref.read(posControllerProvider.notifier).checkout();
    }

    return Container(
      color: AppColors.white,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: AppColors.green700,
          foregroundColor: AppColors.white,
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
          disabledBackgroundColor: AppColors.gray600,
          disabledMouseCursor: SystemMouseCursors.forbidden,
        ),
        onPressed: canCheckout ? onCheckout : null,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Pay',
              style: AppStyles.bodyLarge.copyWith(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.white,
              ),
            ),
            Text(
              balance.formatMoney,
              style: AppStyles.bodyLarge.copyWith(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
