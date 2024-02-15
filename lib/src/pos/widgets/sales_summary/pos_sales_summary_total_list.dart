import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hop_pos/app/app_colors.dart';
import 'package:hop_pos/src/pos/controllers/pos_controller.dart';
import 'package:hop_pos/src/pos/widgets/pos_extras_list.dart';
import 'package:hop_pos/src/pos/widgets/pos_payment_list.dart';
import 'package:hop_pos/src/pos/widgets/pos_rounding.dart';
import 'package:hop_pos/src/pos/widgets/pos_subtotal.dart';
import 'package:hop_pos/src/pos/widgets/sales_summary/pos_sales_summary_balance.dart';
import 'package:hop_pos/src/pos/widgets/sales_summary/pos_sales_summary_cart_discount.dart';
import 'package:hop_pos/src/pos/widgets/sales_summary/pos_sales_summary_total.dart';

class PosSalesSummaryTotalList extends ConsumerWidget {
  const PosSalesSummaryTotalList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final subtotal = ref.watch(posControllerProvider.select((value) => value.order?.subtotal ?? 0));

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
            color: AppColors.gray300,
          ),
        ),
      ),
      child: const Column(
        children: [
          PosSubtotal(),
          PosSalesSymmaryCartDiscount(),
          PosExtrasList(),
          SizedBox(height: 12),
          PosRounding(),
          PosSalesSummaryTotal(),
          PosPaymentList(
            padding: EdgeInsets.symmetric(vertical: 8),
          ),
          PosSalesSummaryBalance(),
        ],
      ),
    );
  }
}
