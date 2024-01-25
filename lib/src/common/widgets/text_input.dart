import 'package:flutter/material.dart';
import 'package:hop_pos/app/app_colors.dart';
import 'package:hop_pos/app/app_styles.dart';

class TextInput extends StatelessWidget {
  const TextInput({super.key, required this.label, required this.content});
  final String label;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppStyles.body.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 5),
        Container(
          color: AppColors.gray200,
          padding: const EdgeInsets.all(8),
          width: double.infinity,
          child: SelectableText(
            content,
            style: const TextStyle(
              overflow: TextOverflow.ellipsis,
            ),
          ),
        )
      ],
    );
  }
}
