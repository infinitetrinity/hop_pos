import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hop_pos/app/app_colors.dart';
import 'package:hop_pos/app/app_styles.dart';
import 'package:hop_pos/src/pos/controllers/pos_controller.dart';

class PosScreening extends HookConsumerWidget {
  const PosScreening({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screening = ref.watch(posControllerProvider.select((prov) => prov.screening));

    return screening == null
        ? Container()
        : SizedBox(
            width: 780,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  screening.name,
                  style: AppStyles.bodyLarge.copyWith(
                    fontSize: 23,
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
              ],
            ),
          );
  }
}
