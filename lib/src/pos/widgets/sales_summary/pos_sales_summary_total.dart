import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hop_pos/app/app_colors.dart';
import 'package:hop_pos/app/app_extension.dart';
import 'package:hop_pos/app/app_styles.dart';
import 'package:hop_pos/src/pos/controllers/pos_controller.dart';

class PosSalesSummaryTotal extends ConsumerWidget {
  const PosSalesSummaryTotal({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final order = ref.watch(posControllerProvider.select((prov) => prov.order));
    final items = ref.watch(posControllerProvider.select((prov) => prov.order?.items?.length ?? 0));

    return Column(
      children: [
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 8),
          decoration: const BoxDecoration(
            border: Border.symmetric(
              horizontal: BorderSide(
                color: AppColors.gray300,
              ),
            ),
          ),
          child: Row(
            children: [
              Text(
                'Total',
                style: AppStyles.bodyLarge.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              const SizedBox(width: 5),
              Text(
                items > 0 ? "(${order?.items?.length} ${items > 1 ? 'items' : 'item'})" : "",
                style: AppStyles.body,
              ),
              const Spacer(),
              Text(
                (order?.total ?? 0).formatMoney,
                style: AppStyles.bodyLarge.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
