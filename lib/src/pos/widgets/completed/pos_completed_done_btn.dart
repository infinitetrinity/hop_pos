import 'package:flutter/material.dart';
import 'package:hop_pos/app/app_colors.dart';
import 'package:hop_pos/app/app_styles.dart';

class PosCompletedDoneBtn extends StatelessWidget {
  const PosCompletedDoneBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 500,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: AppColors.green600,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
        ),
        onPressed: () {},
        child: Text(
          'Done (ESC)',
          style: AppStyles.bodyLarge.copyWith(
            fontSize: 20,
            color: AppColors.white,
          ),
        ),
      ),
    );
  }
}
