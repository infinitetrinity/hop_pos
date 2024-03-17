import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hop_pos/app/app_colors.dart';
import 'package:hop_pos/app/app_styles.dart';

class DialogTitle extends StatelessWidget {
  const DialogTitle({super.key, required this.title, this.color = AppColors.brand600});
  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      color: color,
      child: Row(
        children: [
          Text(
            title,
            style: AppStyles.bodyLarge.copyWith(
              fontSize: 19,
              color: AppColors.white,
              fontWeight: FontWeight.w600,
              decoration: TextDecoration.none,
            ),
          ),
          const Spacer(),
          IconButton(
            onPressed: () => context.pop(),
            icon: const Icon(
              Icons.cancel,
              color: AppColors.white,
            ),
          )
        ],
      ),
    );
  }
}
