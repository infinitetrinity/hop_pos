import 'package:flutter/material.dart';
import 'package:hop_pos/app/app_colors.dart';
import 'package:hop_pos/app/app_styles.dart';

class FormButton extends StatelessWidget {
  const FormButton({
    super.key,
    required this.isSubmitting,
    required this.onSubmit,
    this.text,
    this.background,
    this.isOutline = false,
    this.isDelete = false,
    this.maxWidth = 470,
  });

  final String? text;
  final bool isOutline;
  final bool isDelete;
  final bool isSubmitting;
  final void Function() onSubmit;
  final Color? background;
  final double? maxWidth;

  @override
  Widget build(BuildContext context) {
    Color textColor = isDelete ? AppColors.red600 : (isOutline ? (background ?? AppColors.brand600) : AppColors.white);
    Color buttonColor = isDelete ? AppColors.red600 : background ?? AppColors.brand600;

    Widget buttonContent = isSubmitting
        ? Container(
            height: 26,
            width: 26,
            padding: const EdgeInsets.all(5),
            child: const CircularProgressIndicator(
              color: AppColors.white,
              strokeWidth: 3,
            ),
          )
        : Text(
            text ?? (isDelete ? 'Delete' : 'Submit'),
            style: AppStyles.bodyLarge.copyWith(color: textColor, fontWeight: FontWeight.bold),
          );

    return Container(
      constraints: maxWidth == null ? null : BoxConstraints(maxWidth: maxWidth!),
      child: SizedBox(
        height: 45,
        width: double.infinity,
        child: isOutline || isDelete
            ? OutlinedButton(
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                  padding: const EdgeInsets.all(0),
                  foregroundColor: buttonColor,
                  disabledBackgroundColor: AppColors.gray600,
                  side: isSubmitting
                      ? null
                      : BorderSide(
                          width: 1,
                          color: buttonColor,
                        ),
                ),
                onPressed: isSubmitting ? null : onSubmit,
                child: buttonContent,
              )
            : ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                  padding: const EdgeInsets.all(0),
                  backgroundColor: buttonColor,
                  disabledBackgroundColor: AppColors.gray300,
                ),
                onPressed: isSubmitting ? null : onSubmit,
                child: buttonContent,
              ),
      ),
    );
  }
}
