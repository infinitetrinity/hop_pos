import 'package:flutter/material.dart';
import 'package:hop_pos/app/app_colors.dart';
import 'package:hop_pos/app/app_styles.dart';

class InfoBanner extends StatelessWidget {
  const InfoBanner({
    super.key,
    this.color = AppColors.yellow300,
    required this.content,
  });
  final Color color;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
      width: double.infinity,
      color: color,
      child: Text(
        content,
        style: AppStyles.body,
      ),
    );
  }
}
