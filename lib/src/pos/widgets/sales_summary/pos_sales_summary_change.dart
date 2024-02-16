import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hop_pos/app/app_colors.dart';
import 'package:hop_pos/app/app_extension.dart';
import 'package:hop_pos/app/app_styles.dart';
import 'package:hop_pos/src/pos/controllers/pos_controller.dart';

class PosSalesSummaryChange extends ConsumerWidget {
  const PosSalesSummaryChange({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final change = ref.watch(posControllerProvider.select((prov) => prov.order?.change ?? 0));

    return change > 0
        ? Column(
            children: [
              const SizedBox(height: 8),
              Container(
                decoration: const BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      color: AppColors.gray300,
                    ),
                  ),
                ),
                padding: const EdgeInsets.only(top: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Return Change',
                      style: AppStyles.bodyLarge.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      change.formatMoney,
                      style: AppStyles.bodyLarge.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        : Container();
  }
}
