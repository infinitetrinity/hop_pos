import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hop_pos/app/app_colors.dart';
import 'package:hop_pos/app/app_styles.dart';
import 'package:hop_pos/routes/screening_routes.dart';

class PosBackBtn extends HookWidget {
  const PosBackBtn({super.key});

  @override
  Widget build(BuildContext context) {
    final isHover = useState(false);

    return MouseRegion(
      onEnter: (_) => isHover.value = true,
      onExit: (_) => isHover.value = false,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: isHover.value ? AppColors.brand600 : AppColors.white,
          foregroundColor: isHover.value ? AppColors.white : AppColors.gray700,
          padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 12),
        ),
        onPressed: () => ScreeningRoute().go(context),
        child: Row(
          children: [
            Icon(
              Icons.chevron_left,
              size: 18,
              color: isHover.value ? AppColors.white : AppColors.gray700,
            ),
            const SizedBox(width: 3),
            Text(
              'Back',
              style: AppStyles.body.copyWith(
                color: isHover.value ? AppColors.white : AppColors.gray700,
                letterSpacing: 0,
              ),
            )
          ],
        ),
      ),
    );
  }
}
