import 'package:flutter/material.dart';
import 'package:hop_pos/app/app_colors.dart';
import 'package:hop_pos/app/app_extension.dart';
import 'package:hop_pos/app/app_styles.dart';

class FormCheckbox extends StatelessWidget {
  const FormCheckbox({
    super.key,
    required this.label,
    this.content,
    required this.onTap,
    this.value = false,
  });

  final String label;
  final String? content;
  final Function(bool val) onTap;
  final bool value;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(!value),
      child: Row(
        children: <Widget>[
          Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(3),
              color: value ? AppColors.brand600 : Colors.transparent,
              border: Border.all(
                color: value ? AppColors.brand600 : AppColors.gray300,
              ),
            ),
            child: Center(
              child: value
                  ? const Icon(
                      Icons.check,
                      color: AppColors.white,
                      size: 16,
                    )
                  : null,
            ),
          ),
          const SizedBox(width: 10),
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label, style: AppStyles.body),
                if (!content.isNullOrEmpty) ...[
                  Text(
                    content!,
                    style: AppStyles.body.copyWith(
                      color: AppColors.gray500,
                      height: 1.3,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
