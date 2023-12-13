import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hop_pos/app/app_colors.dart';
import 'package:hop_pos/app/app_styles.dart';
import 'package:hop_pos/src/common/widgets/form_hint.dart';
import 'package:hop_pos/src/common/widgets/form_label.dart';

class FormTextField extends HookWidget {
  const FormTextField({
    super.key,
    this.label,
    this.labelHint,
    this.value,
    this.placeholder,
    this.backgroundColor = AppColors.white,
    this.hint,
    this.validator,
    this.isPassword = false,
    this.isRequired = false,
    this.isDisabled = false,
    this.keyboardType = TextInputType.text,
    this.prefixIcon,
    this.suffixIcon,
    this.inputFormatters,
    this.onChanged,
    this.onSaved,
    this.minLines = 1,
    this.maxLines = 1,
    this.suffix,
    this.prefix,
  });

  final String? label;
  final String? labelHint;
  final String? value;
  final String? placeholder;
  final Color? backgroundColor;
  final String? hint;
  final String? Function(String?)? validator;
  final bool isPassword;
  final bool isRequired;
  final bool isDisabled;
  final TextInputType keyboardType;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final List<TextInputFormatter>? inputFormatters;
  final ValueChanged<String>? onChanged;
  final void Function(String?)? onSaved;
  final int? minLines;
  final int? maxLines;
  final String? suffix;
  final String? prefix;

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller =
        useTextEditingController(text: "${prefix ?? ''}$value${suffix ?? ''}");

    if ((suffix?.length ?? 0) > 0) {
      final offset = controller.text.length - (suffix?.length ?? 0);
      controller.selection =
          TextSelection.collapsed(offset: offset > 0 ? offset : 0);
    }

    useEffect(() {
      if (controller.text.isEmpty &&
          value != null &&
          value!.isNotEmpty &&
          value != '0.0') {
        controller.text = "${prefix ?? ''}$value${suffix ?? ''}";
        final offset = controller.text.length - (suffix?.length ?? 0);
        controller.selection = TextSelection.collapsed(offset: offset);
      }

      if (controller.text.isNotEmpty && (value == null || value!.isEmpty)) {
        controller.text = "";
      }

      return null;
    }, [value]);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null)
          FormLabel(
            label: label,
            hint: labelHint,
            isRequired: isRequired,
          ),
        Row(
          children: [
            Expanded(
              child: TextFormField(
                style: AppStyles.body.copyWith(
                  color: AppColors.gray800,
                ),
                validator: validator,
                readOnly: isDisabled,
                maxLines: maxLines,
                minLines: minLines,
                controller: controller,
                inputFormatters: inputFormatters,
                decoration: InputDecoration(
                  errorMaxLines: 2,
                  filled: true,
                  errorStyle:
                      AppStyles.bodySmall.copyWith(color: AppColors.red600),
                  contentPadding: const EdgeInsets.all(10),
                  enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(3)),
                    borderSide: BorderSide(width: 1, color: AppColors.gray300),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(3)),
                    borderSide: BorderSide(width: 1, color: AppColors.brand600),
                  ),
                  focusedErrorBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(3)),
                    borderSide: BorderSide(width: 1, color: AppColors.red600),
                  ),
                  errorBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(3)),
                    borderSide: BorderSide(width: 1, color: AppColors.red600),
                  ),
                  fillColor: isDisabled ? AppColors.gray100 : backgroundColor,
                  hoverColor: Colors.transparent,
                  hintText: placeholder,
                  prefixIcon: prefixIcon,
                  suffixIcon: suffixIcon,
                  hintStyle: AppStyles.body.copyWith(color: AppColors.gray400),
                ),
                keyboardType: keyboardType,
                obscureText: isPassword,
                onChanged: onChanged,
                onSaved: onSaved,
              ),
            ),
          ],
        ),
        if (hint != null && hint!.isNotEmpty) FormHint(hint: hint!),
      ],
    );
  }
}
