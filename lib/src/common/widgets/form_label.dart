import 'package:flutter/material.dart';
import 'package:hop_pos/app/app_colors.dart';
import 'package:hop_pos/app/app_styles.dart';
import 'package:hop_pos/src/common/widgets/form_hint.dart';

class FormLabel extends StatelessWidget {
  const FormLabel({
    super.key,
    required this.label,
    this.hint,
    this.isRequired = false,
  });
  final String? label;
  final String? hint;
  final bool isRequired;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(label!, style: AppStyles.bodyLarge),
            if (isRequired)
              Text(
                '*',
                style: Theme.of(context).textTheme.labelSmall!.copyWith(color: AppColors.red600),
              ),
            if (hint != null && hint!.isNotEmpty) FormHint(hint: hint!),
          ],
        ),
        const SizedBox(height: 5),
      ],
    );
  }
}
