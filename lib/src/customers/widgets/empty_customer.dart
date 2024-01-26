import 'package:flutter/material.dart';
import 'package:hop_pos/app/app_colors.dart';
import 'package:hop_pos/app/app_styles.dart';

class EmptyCustomer extends StatelessWidget {
  const EmptyCustomer({super.key, required this.isHover});
  final bool isHover;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Select Customer',
              style: AppStyles.bodyLarge.copyWith(
                fontWeight: FontWeight.w600,
                color: isHover ? AppColors.white : AppColors.gray800,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              'Click here to select customer',
              style: AppStyles.bodySmall.copyWith(
                color: isHover ? AppColors.white : AppColors.gray600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
