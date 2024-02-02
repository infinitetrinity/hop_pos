import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hop_pos/app/app_colors.dart';
import 'package:hop_pos/app/app_styles.dart';
import 'package:hop_pos/src/pos/widgets/pos_discard_sales_dialog.dart';

class PosDiscaordSalesBtn extends HookWidget {
  const PosDiscaordSalesBtn({super.key});

  @override
  Widget build(BuildContext context) {
    final isHover = useState(false);

    return MouseRegion(
      onEnter: (_) => isHover.value = true,
      onExit: (_) => isHover.value = false,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: isHover.value ? AppColors.red600 : AppColors.white,
          foregroundColor: isHover.value ? AppColors.white : AppColors.gray700,
          padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 12),
        ),
        onPressed: () => showDialog(
          context: context,
          builder: (_) => const PosDiscardSalesDialog(),
        ),
        child: Row(
          children: [
            Icon(
              Icons.delete_outline,
              size: 18,
              color: isHover.value ? AppColors.white : AppColors.gray700,
            ),
            const SizedBox(width: 5),
            Text(
              'Discard Sales',
              style: AppStyles.body.copyWith(color: isHover.value ? AppColors.white : AppColors.gray700),
            )
          ],
        ),
      ),
    );
  }
}
