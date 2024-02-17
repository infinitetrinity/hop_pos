import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hop_pos/app/app_colors.dart';
import 'package:hop_pos/app/app_extension.dart';
import 'package:hop_pos/app/app_styles.dart';
import 'package:hop_pos/src/order_payments/models/order_payment_with_method.dart';
import 'package:hop_pos/src/pos/controllers/pos_controller.dart';
import 'package:loader_overlay/loader_overlay.dart';

class PosPaymentTile extends HookConsumerWidget {
  const PosPaymentTile({super.key, required this.payment, required this.index});
  final OrderPaymentWithMethod payment;
  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isHover = useState(false);

    Future<void> deletePayment() async {
      context.loaderOverlay.show();
      await ref.read(posControllerProvider.notifier).deleteOrderPayment(payment.payment);
      if (context.mounted) {
        context.loaderOverlay.hide();
      }
    }

    return payment.method == null
        ? Container()
        : Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${payment.method!.name} Paid',
                      style: AppStyles.body,
                    ),
                    const SizedBox(height: 3),
                    Text(
                      payment.payment.displayCreatedAt ?? '',
                      style: AppStyles.bodySmall.copyWith(
                        color: AppColors.gray800,
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      (payment.payment.amount ?? 0).formatMoney,
                      style: AppStyles.body,
                    ),
                    const SizedBox(height: 3),
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      onEnter: (_) => isHover.value = true,
                      onExit: (_) => isHover.value = false,
                      child: GestureDetector(
                        onTap: deletePayment,
                        child: Text(
                          '(Remove)',
                          style: AppStyles.body.copyWith(
                            color: AppColors.red600,
                            decorationColor: AppColors.red600,
                            decoration: isHover.value ? TextDecoration.underline : null,
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
  }
}
