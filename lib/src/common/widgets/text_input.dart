import 'package:flutter/material.dart';
import 'package:hop_pos/app/app_colors.dart';
import 'package:hop_pos/app/app_styles.dart';
import 'package:hop_pos/src/common/widgets/form_label.dart';

class TextInput extends StatelessWidget {
  const TextInput({super.key, required this.label, required this.content});
  final String label;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FormLabel(label: label),
        Container(
          color: AppColors.gray200,
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
          width: double.infinity,
          child: SelectableText(
            content,
            style: AppStyles.body.copyWith(
              overflow: TextOverflow.ellipsis,
            ),
          ),
        )
      ],
    );
  }
}
