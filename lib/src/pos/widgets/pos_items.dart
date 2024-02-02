import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hop_pos/app/app_colors.dart';
import 'package:hop_pos/src/pos/controllers/pos_controller.dart';
import 'package:hop_pos/src/pos/widgets/pos_item_tile.dart';

class PosItems extends ConsumerWidget {
  const PosItems({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final order = ref.watch(posControllerProvider.select((prov) => prov.order));

    return order == null || order.items == null
        ? Container()
        : Container(
            constraints: const BoxConstraints(maxHeight: 240),
            decoration: const BoxDecoration(
              color: AppColors.white,
              border: Border(
                bottom: BorderSide(color: AppColors.gray300),
              ),
            ),
            child: ListView.builder(
              shrinkWrap: true,
              physics: const AlwaysScrollableScrollPhysics(),
              itemCount: order.items!.length,
              itemBuilder: (context, index) => PosItemTile(
                key: Key('pos-items-${order.order.invoiceNo}-$index'),
                item: order.items![index],
                index: index + 1,
              ),
            ),
          );
  }
}
