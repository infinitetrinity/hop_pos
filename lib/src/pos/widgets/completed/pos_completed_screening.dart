import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hop_pos/app/app_colors.dart';
import 'package:hop_pos/app/app_styles.dart';
import 'package:hop_pos/src/pos/controllers/pos_controller.dart';

class PosCompletedScreening extends ConsumerWidget {
  const PosCompletedScreening({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final customersCount = ref.watch(posControllerProvider.notifier).getCustomersCount();
    final screening = ref.watch(posControllerProvider.select((prov) => prov.screening));

    return screening == null
        ? Container()
        : Container(
            width: 500,
            decoration: BoxDecoration(
              border: Border.all(
                color: AppColors.gray300,
              ),
            ),
            padding: const EdgeInsets.all(15),
            child: Row(
              children: [
                const Padding(
                  padding: EdgeInsets.only(right: 12),
                  child: Icon(
                    Icons.medical_information_rounded,
                    color: AppColors.gray800,
                    size: 28,
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        screening.name,
                        style: AppStyles.bodyLarge.copyWith(
                          color: AppColors.gray800,
                          fontWeight: FontWeight.w600,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      if (screening.corporate != null) ...[
                        const SizedBox(height: 3),
                        Text(
                          screening.corporate!,
                          style: AppStyles.bodySmall.copyWith(
                            color: AppColors.gray600,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                      FutureBuilder<int?>(
                        future: customersCount,
                        builder: (_, snapshot) {
                          return Column(
                            children: [
                              const SizedBox(height: 2),
                              Text(
                                "${snapshot.data} customers",
                                style: AppStyles.body.copyWith(
                                  color: AppColors.gray500,
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
  }
}
