import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hop_pos/app/app_colors.dart';
import 'package:hop_pos/app/app_extension.dart';
import 'package:hop_pos/app/app_styles.dart';
import 'package:hop_pos/src/order_payments/models/order_payment.dart';
import 'package:hop_pos/src/payment_methods/controllers/payment_method_controller.dart';
import 'package:hop_pos/src/payment_methods/models/payment_method.dart';
import 'package:hop_pos/src/pos/controllers/pos_controller.dart';
import 'package:loader_overlay/loader_overlay.dart';

class PosPaymentTile extends HookConsumerWidget {
  const PosPaymentTile({super.key, required this.payment, required this.index});
  final OrderPayment payment;
  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isHover = useState(false);
    final paymentMethod = payment.paymentMethodId == null
        ? null
        : ref.watch(paymentMethodControllerProvider.notifier).getPaymentMethodById(payment.paymentMethodId!);

    Future<void> deletePayment() async {
      context.loaderOverlay.show();
      await ref.read(posControllerProvider.notifier).deleteOrderPayment(payment);
      if (context.mounted) {
        context.loaderOverlay.hide();
      }
    }

    return FutureBuilder<PaymentMethod?>(
      future: paymentMethod,
      builder: (_, snapshot) {
        return snapshot.data == null
            ? Container()
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${snapshot.data?.name} Paid',
                        style: AppStyles.body,
                      ),
                      const SizedBox(height: 3),
                      Text(
                        payment.displayCreatedAt,
                        style: AppStyles.body.copyWith(
                          color: AppColors.gray800,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        (payment.amount ?? 0).formatMoney,
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
              );
      },
    );
  }
}
