import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hop_pos/app/app_colors.dart';
import 'package:hop_pos/app/app_styles.dart';
import 'package:hop_pos/routes/screening_routes.dart';
import 'package:hop_pos/src/pos/states/pos_cart_state.dart';

class PosScreening extends HookConsumerWidget {
  const PosScreening({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isHover = useState(false);
    final screening = ref.watch(posCartStateProvider.select((prov) => prov.screening));

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
                            style: AppStyles.body.copyWith(
                              fontSize: 18,
                              color: isHover.value ? AppColors.white : AppColors.gray800,
                            ),
                          ),
                          Text(
                            'Click to change screening',
                            style: AppStyles.body.copyWith(
                              fontSize: 12,
                              color: isHover.value ? AppColors.white : AppColors.gray600,
                            ),
                          ),
                        ]
                      : [
                          Text(
                            screening.name,
                            style: AppStyles.body.copyWith(
                              fontSize: 16,
                              color: isHover.value ? AppColors.white : AppColors.gray800,
                              height: 1.1,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                          if (screening.corporate != null) ...[
                            const SizedBox(height: 5),
                            Text(
                              screening.corporate!,
                              style: AppStyles.body.copyWith(
                                fontSize: 13,
                                color: isHover.value ? AppColors.white : AppColors.gray600,
                                height: 1.1,
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
                                style: AppStyles.body.copyWith(
                                  fontSize: 11,
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
