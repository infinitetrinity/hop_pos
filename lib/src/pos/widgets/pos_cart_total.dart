import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hop_pos/app/app_colors.dart';
import 'package:hop_pos/src/pos/controllers/pos_controller.dart';
import 'package:hop_pos/src/pos/widgets/pos_cart_discount.dart';
import 'package:hop_pos/src/pos/widgets/pos_extras_list.dart';
import 'package:hop_pos/src/pos/widgets/pos_pay_btn.dart';
import 'package:hop_pos/src/pos/widgets/pos_payment_list.dart';
import 'package:hop_pos/src/pos/widgets/pos_rounding.dart';
import 'package:hop_pos/src/pos/widgets/pos_stf.dart';
import 'package:hop_pos/src/pos/widgets/pos_subtotal.dart';
import 'package:hop_pos/src/pos/widgets/pos_total.dart';
import 'package:hop_pos/src/pos/widgets/pos_utf.dart';

class PosCartTotal extends ConsumerWidget {
  const PosCartTotal({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isUtf = ref.watch(posControllerProvider.select((prov) => prov.order?.order.isUtf ?? false));
    final isStf = ref.watch(posControllerProvider.select((prov) => prov.order?.order.isStf ?? false));

    return Column(
      children: [
        Container(
          decoration: const BoxDecoration(
            color: AppColors.white,
            border: Border(),
          ),
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: const Column(
            children: [
              PosSubtotal(),
              PosCartDiscount(),
              PosExtrasList(),
            ],
          ),
        ),
        Container(
          decoration: const BoxDecoration(
            color: AppColors.white,
            border: Border(
              top: BorderSide(color: AppColors.gray300),
              bottom: BorderSide(color: AppColors.gray300),
            ),
          ),
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: Column(
            children: [
              if (isUtf || isStf)
                const Column(
                  children: [
                    PosUTF(),
                    PosSTF(),
                  ],
                ),
              const PosRounding(),
              const SizedBox(height: 8),
              const PosTotal(),
            ],
          ),
        ),
        const PosPaymentList(),
        const PosPayBtn(),
      ],
    );
  }
}
