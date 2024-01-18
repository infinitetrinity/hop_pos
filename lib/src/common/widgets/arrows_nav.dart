import 'package:flutter/material.dart';
import 'package:hop_pos/app/app_colors.dart';

class ArrowsNav extends StatelessWidget {
  const ArrowsNav({super.key, this.onPrevPressed, this.onNextPressed});
  final void Function()? onPrevPressed;
  final void Function()? onNextPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            disabledMouseCursor: SystemMouseCursors.forbidden,
            backgroundColor: AppColors.white,
            shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
          ),
          onPressed: onPrevPressed,
          child: const Icon(
            size: 18,
            Icons.arrow_back,
            color: AppColors.gray800,
          ),
        ),
        const SizedBox(width: 15),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            disabledMouseCursor: SystemMouseCursors.forbidden,
            backgroundColor: AppColors.white,
            shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
          ),
          onPressed: onNextPressed,
          child: const Icon(
            size: 18,
            Icons.arrow_forward,
            color: AppColors.gray800,
          ),
        ),
      ],
    );
  }
}
