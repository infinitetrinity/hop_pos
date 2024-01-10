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
      onEnter: (_) => isHover.value = true,
      onExit: (_) => isHover.value = false,
      child: ListTile(
        onTap: () {},
        contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 15),
        tileColor: AppColors.white,
        splashColor: AppColors.brand600,
        title: Text(
          screening.name,
          overflow: TextOverflow.ellipsis,
          style: AppStyles.body.copyWith(
            fontWeight: FontWeight.w600,
            color: isHover.value ? AppColors.white : AppColors.gray800,
          ),
        ),
        subtitle: Text(
          screening.corporate ?? '',
          style: AppStyles.bodySmall.copyWith(
            color: isHover.value ? AppColors.white : AppColors.gray800,
          ),
        ),
        hoverColor: AppColors.brand600,
        horizontalTitleGap: 10,
      ),
    );
  }
}
