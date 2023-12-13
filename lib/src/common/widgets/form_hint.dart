import 'package:flutter/material.dart';
import 'package:hop_pos/app/app_styles.dart';

class FormHint extends StatelessWidget {
  const FormHint({required this.hint, super.key});
  final String hint;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 3),
        Text(
          hint,
          style: AppStyles.body.copyWith(
            color: AppStyles.body.color!.withOpacity(0.7),
          ),
        ),
      ],
    );
  }
}
