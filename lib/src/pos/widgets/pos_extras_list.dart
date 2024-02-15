import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hop_pos/app/app_extension.dart';
import 'package:hop_pos/app/app_styles.dart';
import 'package:hop_pos/src/pos/controllers/pos_controller.dart';

class PosExtrasList extends ConsumerWidget {
  const PosExtrasList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final extras = ref.watch(posControllerProvider.select((value) => value.order?.extras));

    return extras == null
        ? Container()
        : Column(
            children: [
              const SizedBox(height: 8),
              for (final extra in extras) ...[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      extra.displayName,
                      style: AppStyles.bodyLarge,
                    ),
                    Text(
                      (extra.calculatedAmount ?? 0).formatMoney,
                      style: AppStyles.bodyLarge,
                    ),
                  ],
                ),
              ]
            ],
          );
  }
}
