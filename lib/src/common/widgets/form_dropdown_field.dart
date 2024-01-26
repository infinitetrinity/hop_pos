import 'package:flutter/material.dart';
import 'package:hop_pos/app/app_colors.dart';
import 'package:hop_pos/app/app_styles.dart';
import 'package:hop_pos/src/common/widgets/form_label.dart';

class FormDropdownField extends StatelessWidget {
  const FormDropdownField({
    super.key,
    this.label,
    this.value,
    this.isRequired = false,
    this.backgroundColor = AppColors.white,
    this.validator,
    this.onChanged,
    required this.options,
  });

  final String? label;
  final String? value;
  final bool isRequired;
  final Color? backgroundColor;
  final String? Function(String?)? validator;
  final void Function(String?)? onChanged;
  final Map<String?, String> options;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null)
          FormLabel(
            label: label,
            isRequired: isRequired,
          ),
        DropdownButtonFormField(
          decoration: InputDecoration(
            enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(3)),
              borderSide: BorderSide(width: 1, color: AppColors.gray300),
            ),
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(3)),
              borderSide: BorderSide(width: 1, color: AppColors.gray300),
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 10),
            filled: true,
            fillColor: backgroundColor,
          ),
          value: value ?? options.keys.first,
          validator: validator,
          onChanged: onChanged,
          items: options.entries.map((MapEntry<String?, String> entry) {
            return DropdownMenuItem(
              value: entry.key,
              child: Text(
                entry.value,
                style: AppStyles.body,
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
