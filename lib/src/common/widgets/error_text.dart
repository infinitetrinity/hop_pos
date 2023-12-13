import 'package:flutter/material.dart';
import 'package:hop_pos/app/app_colors.dart';
import 'package:hop_pos/app/app_styles.dart';

class ErrorText extends StatelessWidget {
  const ErrorText(this.error, {super.key});
  final String? error;

  @override
  Widget build(BuildContext context) {
    return error != null
        ? Column(
            children: [
              Text(
                error!,
                style: AppStyles.body.copyWith(
                  color: AppColors.red600,
                ),
              ),
              const SizedBox(height: 10),
            ],
          )
        : Container();
  }
}
