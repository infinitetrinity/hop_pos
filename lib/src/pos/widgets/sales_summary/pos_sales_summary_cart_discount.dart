import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hop_pos/app/app_extension.dart';
import 'package:hop_pos/app/app_styles.dart';
import 'package:hop_pos/src/pos/controllers/pos_controller.dart';

class PosSalesSymmaryCartDiscount extends ConsumerWidget {
  const PosSalesSymmaryCartDiscount({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final order = ref.watch(posControllerProvider.select((prov) => prov.order));
    final isPercentageDiscount = ref.watch(posControllerProvider
        .select((prov) => prov.order?.order.isDiscountPercentage == true && (prov.order?.order.discount ?? 0) > 0));
    final discount = ref.watch(posControllerProvider.select((prov) => prov.order?.cartDiscount ?? 0));

    return discount > 0
        ? Padding(
            padding: const EdgeInsets.only(top: 12, bottom: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Cart Discount ${isPercentageDiscount ? "(${order?.order.discount}%)" : ""}',
                  style: AppStyles.bodyLarge.copyWith(),
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
