import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hop_pos/app/app_colors.dart';
import 'package:hop_pos/src/common/widgets/form_button.dart';

class DialogFooter extends StatelessWidget {
  const DialogFooter({
    super.key,
    required this.isSubmitting,
    required this.onSubmit,
    this.submitLabel = 'Submit',
    this.color = AppColors.brand600,
  });
  final bool isSubmitting;
  final void Function() onSubmit;
  final String submitLabel;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        FormButton(
          text: 'Cancel',
          background: AppColors.gray500,
          maxWidth: 100,
          onSubmit: () => context.pop(),
        ),
        const SizedBox(width: 10),
        FormButton(
          text: submitLabel,
          background: color,
          maxWidth: 140,
          isSubmitting: isSubmitting,
          onSubmit: onSubmit,
        ),
      ],
    );
  }
}
