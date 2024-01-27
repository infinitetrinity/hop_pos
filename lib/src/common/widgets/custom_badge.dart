import 'package:flutter/material.dart';
import 'package:hop_pos/app/app_colors.dart';
import 'package:hop_pos/app/app_styles.dart';

class CustomBadge extends StatelessWidget {
  const CustomBadge({
    super.key,
    this.bgColor = AppColors.brand500,
    required this.text,
  });
  final Color bgColor;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 8),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: const BorderRadius.all(Radius.circular(5)),
      ),
      child: Text(
        text,
        style: AppStyles.bodySmall.copyWith(
          color: AppColors.white,
          fontWeight: FontWeight.w600,
          height: 1,
        ),
      ),
    );
  }
}
