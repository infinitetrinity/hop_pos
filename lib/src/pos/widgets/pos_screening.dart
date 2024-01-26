import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hop_pos/app/app_colors.dart';
import 'package:hop_pos/app/app_styles.dart';
import 'package:hop_pos/routes/screening_routes.dart';
import 'package:hop_pos/src/pos/controllers/pos_controller.dart';

class PosScreening extends HookConsumerWidget {
  const PosScreening({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isHover = useState(false);
    final screening = ref.watch(posControllerProvider.select((prov) => prov.screening));

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => isHover.value = true,
      onExit: (_) => isHover.value = false,
      child: GestureDetector(
        onTap: () {
          ScreeningRoute().push(context);
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
          color: isHover.value ? AppColors.brand600 : AppColors.white,
          child: Row(
            children: [
              Icon(
                Icons.medical_information_rounded,
                color: isHover.value ? AppColors.white : AppColors.gray800,
                size: 28,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: screening == null
                      ? [
                          Text(
                            'No Screening Selected',
                            style: AppStyles.bodyLarge.copyWith(
                              fontWeight: FontWeight.w600,
                              color: isHover.value ? AppColors.white : AppColors.gray800,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            'Click to change screening',
                            style: AppStyles.bodySmall.copyWith(
                              color: isHover.value ? AppColors.white : AppColors.gray600,
                            ),
                          ),
                        ]
                      : [
                          Text(
                            screening.name,
                            style: AppStyles.bodyLarge.copyWith(
                              color: isHover.value ? AppColors.white : AppColors.gray800,
                              fontWeight: FontWeight.w600,
                            ),
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                          if (screening.corporate != null) ...[
                            const SizedBox(height: 5),
                            Text(
                              screening.corporate!,
                              style: AppStyles.bodySmall.copyWith(
                                color: isHover.value ? AppColors.white : AppColors.gray600,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                          if (isHover.value) ...[
                            const SizedBox(height: 10),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: Text(
                                'Click to change screening',
                                textAlign: TextAlign.right,
                                style: AppStyles.bodySmall.copyWith(
                                  color: isHover.value ? AppColors.white : AppColors.gray500,
                                ),
                              ),
                            ),
                          ],
                        ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
