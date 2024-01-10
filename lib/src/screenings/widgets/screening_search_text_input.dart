import 'package:flutter/material.dart';
import 'package:hop_pos/app/app_colors.dart';
import 'package:hop_pos/app/app_styles.dart';

class ScreeningSearchTextInput extends StatelessWidget {
  const ScreeningSearchTextInput({super.key, required this.controller, required this.focusNode});
  final TextEditingController controller;
  final FocusNode focusNode;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      focusNode: focusNode,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.white,
        hoverColor: AppColors.gray50,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(3)),
          borderSide: BorderSide(color: AppColors.gray300),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(3)),
          borderSide: BorderSide(color: AppColors.gray300),
        ),
        labelText: 'Search Screening',
        labelStyle: AppStyles.body.copyWith(height: 1),
        prefixIcon: const Icon(Icons.search, color: AppColors.gray500),
        contentPadding: const EdgeInsets.all(10),
      ),
    );
  }
}
