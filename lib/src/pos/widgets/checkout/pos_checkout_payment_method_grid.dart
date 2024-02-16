import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hop_pos/app/app_colors.dart';
import 'package:hop_pos/app/app_extension.dart';
import 'package:hop_pos/app/app_styles.dart';
import 'package:hop_pos/src/common/services/flash_message.dart';
import 'package:hop_pos/src/payment_methods/models/payment_method.dart';
import 'package:hop_pos/src/pos/controllers/pos_controller.dart';

class PosCheckoutPaymentMethodGrid extends ConsumerWidget {
  const PosCheckoutPaymentMethodGrid({super.key, required this.method});
  final PaymentMethod method;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Future<void> onPayment() async {
      if (method.id == 0 && method.name == "Pay Later") {
        ref.read(posControllerProvider.notifier).setPayLater(true);
        return;
      }

      final amount = ref.read(posControllerProvider.select((prov) => prov.checkoutAmount ?? 0));
      await ref.read(posControllerProvider.notifier).addNewOrderPayment(method);
      ref.read(flashMessageProvider).flash(message: 'Payment of ${amount.formatMoney} by ${method.name} added.');
    }

    return TextButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
          return AppColors.green600;
        }),
        overlayColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
          return AppColors.green700;
        }),
        shape: MaterialStateProperty.resolveWith<OutlinedBorder?>((Set<MaterialState> states) {
          return RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6.0),
          );
        }),
      ),
      onPressed: onPayment,
      child: Text(
        method.name,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: AppStyles.bodyLarge.copyWith(
          fontSize: 20,
          color: AppColors.white,
        ),
      ),
    );
  }
}
