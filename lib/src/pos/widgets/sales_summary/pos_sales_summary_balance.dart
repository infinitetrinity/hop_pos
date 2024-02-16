import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hop_pos/app/app_extension.dart';
import 'package:hop_pos/app/app_styles.dart';
import 'package:hop_pos/src/pos/controllers/pos_controller.dart';

class PosSalesSummaryBalance extends ConsumerWidget {
  const PosSalesSummaryBalance({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final totalPayment = ref.watch(posControllerProvider.select((prov) => prov.order?.totalPayment ?? 0));
    final balance = ref.watch(posControllerProvider.select((prov) => prov.order?.balance ?? 0));

    return totalPayment > 0
        ? Column(
            children: [
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Balance',
                    style: AppStyles.bodyLarge.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    balance.formatMoney,
                    style: AppStyles.bodyLarge.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ],
          )
        : Container();
  }
}
