import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hop_pos/app/app_extension.dart';
import 'package:hop_pos/app/app_styles.dart';
import 'package:hop_pos/src/pos/controllers/pos_controller.dart';

class PosRounding extends ConsumerWidget {
  const PosRounding({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final order = ref.watch(posControllerProvider.select((prov) => prov.order));

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Rounding',
          style: AppStyles.bodyLarge,
        ),
        Text(
          (order?.rounding ?? 0).formatMoney,
          style: AppStyles.bodyLarge,
        ),
      ],
    );
  }
}
