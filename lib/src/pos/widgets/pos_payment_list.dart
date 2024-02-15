import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hop_pos/app/app_colors.dart';
import 'package:hop_pos/src/pos/controllers/pos_controller.dart';
import 'package:hop_pos/src/pos/widgets/pos_payment_tile.dart';

class PosPaymentList extends ConsumerWidget {
  const PosPaymentList({
    super.key,
    this.padding = const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
  });
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final order = ref.watch(posControllerProvider.select((prov) => prov.order));
    final payments = ref.watch(posControllerProvider.select((prov) => prov.order?.payments));

    return order == null || payments == null || payments.isEmpty
        ? Container()
        : Container(
            constraints: const BoxConstraints(maxHeight: 100),
            decoration: const BoxDecoration(
              color: AppColors.white,
              border: Border(
                bottom: BorderSide(color: AppColors.gray300),
              ),
            ),
            padding: padding,
            child: ListView.builder(
              shrinkWrap: true,
              physics: const AlwaysScrollableScrollPhysics(),
              itemCount: payments.length,
              itemBuilder: (context, index) => PosPaymentTile(
                key: Key('pos-payments-${order.order.invoiceNo}-$index'),
                payment: order.payments![index],
                index: index + 1,
              ),
            ),
          );
  }
}
