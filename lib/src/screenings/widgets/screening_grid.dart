import 'package:flutter/material.dart';
import 'package:hop_pos/app/app_colors.dart';
import 'package:hop_pos/src/screenings/models/screening.dart';

class ScreeningGrid extends StatelessWidget {
  const ScreeningGrid({super.key, required this.screening});
  final Screening screening;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      height: 50,
      child: Text(screening.name),
    );
  }
}
