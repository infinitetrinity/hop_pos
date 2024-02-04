import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hop_pos/app/app_extension.dart';
import 'package:hop_pos/app/app_styles.dart';
import 'package:hop_pos/src/pos/controllers/pos_controller.dart';

class PosTotal extends ConsumerWidget {
  const PosTotal({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final order = ref.watch(posControllerProvider.select((prov) => prov.order));
    final items = ref.watch(posControllerProvider.select((prov) => prov.order?.items?.length ?? 0));

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Total ${items > 0 ? "(${order?.items?.length} ${items > 1 ? 'items' : 'item'})" : ""}',
          style: AppStyles.bodyLarge,
        ),
        Text(
          (order?.total ?? 0).formatMoney,
          style: AppStyles.bodyLarge,
        ),
      ],
    );
  }
}
