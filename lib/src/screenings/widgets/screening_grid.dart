import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hop_pos/app/app_colors.dart';
import 'package:hop_pos/app/app_styles.dart';
import 'package:hop_pos/src/pos/states/pos_cart_state.dart';
import 'package:hop_pos/src/screenings/controllers/screening_controller.dart';
import 'package:hop_pos/src/screenings/models/screening.dart';

class ScreeningGrid extends HookConsumerWidget {
  const ScreeningGrid({super.key, required this.screening});
  final Screening screening;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isHover = useState(false);
    final selectedScreening = ref.watch(posCartStateProvider.select((prov) => prov.screening));

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => isHover.value = true,
      onExit: (_) => isHover.value = false,
      child: GestureDetector(
        onTap: () {
          ref.read(screeningControllerProvider.notifier).selectScreening(screening);
        },
        child: Container(
          padding: const EdgeInsets.all(10),
          color: selectedScreening?.id == screening.id || isHover.value ? AppColors.brand600 : AppColors.white,
          child: Center(
            child: Text(
              screening.name,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              maxLines: 5,
              style: AppStyles.body.copyWith(
                color: selectedScreening?.id == screening.id || isHover.value ? AppColors.white : AppColors.gray800,
                fontWeight: FontWeight.bold,
                height: 1.15,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
