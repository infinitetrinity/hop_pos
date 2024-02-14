import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hop_pos/app/app_colors.dart';
import 'package:hop_pos/src/pos/controllers/pos_controller.dart';
import 'package:hop_pos/src/pos/widgets/pos_item_tile.dart';

class PosItems extends HookConsumerWidget {
  const PosItems({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = useScrollController();
    final order = ref.watch(posControllerProvider.select((prov) => prov.order));

    ref.listen(posControllerProvider.select((prov) => prov.order?.items), (previous, current) {
      Timer(const Duration(milliseconds: 250), () {
        if (controller.hasClients && (previous?.length ?? 0) > 0 && (previous?.length ?? 0) < (current?.length ?? 0)) {
          controller.animateTo(
            controller.position.maxScrollExtent,
            duration: const Duration(milliseconds: 300),
            curve: Curves.fastOutSlowIn,
          );
        }
      });
    });

    return order == null || order.items == null
        ? Container()
        : Container(
            constraints: const BoxConstraints(maxHeight: 325),
            decoration: const BoxDecoration(
              color: AppColors.white,
            ),
            child: ListView.builder(
              controller: controller,
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
