import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hop_pos/app/app_colors.dart';
import 'package:hop_pos/app/app_extension.dart';
import 'package:hop_pos/app/app_styles.dart';
import 'package:hop_pos/src/pos/controllers/pos_controller.dart';
import 'package:hop_pos/src/pos/widgets/pos_cart_discount_dialog.dart';

class PosCartDiscount extends ConsumerWidget {
  const PosCartDiscount({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final order = ref.watch(posControllerProvider.select((prov) => prov.order));
    final isPercentageDiscount = ref.watch(posControllerProvider
        .select((prov) => prov.order?.order.isDiscountPercentage == true && (prov.order?.order.discount ?? 0) > 0));
    final discount = ref.watch(posControllerProvider.select((prov) => prov.order?.cartDiscount ?? 0));

    return order != null && (order.balanceBeforeDiscount > 0 || discount > 0)
        ? Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: AppColors.brand600,
                    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(0))),
                    padding: const EdgeInsets.all(3),
                  ),
                  onPressed: () => showDialog(
                    context: context,
                    builder: (_) => const PosCartDiscountDialog(),
                  ),
                  child: Text(
                    'Cart Discount ${isPercentageDiscount ? "(${order.order.discount}%)" : ""}',
                    style: AppStyles.body.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                ),
                Text(
                  "-${discount.formatMoney}",
                  style: AppStyles.bodyLarge,
                ),
              ],
            ),
          )
        : Container();
  }
}
