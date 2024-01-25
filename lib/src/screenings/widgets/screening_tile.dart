import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hop_pos/app/app_colors.dart';
import 'package:hop_pos/app/app_styles.dart';
import 'package:hop_pos/src/screenings/models/screening.dart';

class ScreeningTile extends HookWidget {
  const ScreeningTile(this.screening, {super.key});
  final Screening screening;

  @override
  Widget build(BuildContext context) {
    final isHover = useState(false);

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => isHover.value = true,
      onExit: (_) => isHover.value = false,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
        color: isHover.value ? AppColors.brand600 : AppColors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              screening.name,
              overflow: TextOverflow.ellipsis,
              style: AppStyles.bodyLarge.copyWith(
                fontWeight: FontWeight.w600,
                color: isHover.value ? AppColors.white : AppColors.gray800,
              ),
            ),
            const SizedBox(height: 3),
            Text(
              screening.corporate ?? '',
              style: AppStyles.bodySmall.copyWith(
                color: isHover.value ? AppColors.white : AppColors.gray800,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
