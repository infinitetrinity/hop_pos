import 'package:flutter/material.dart';
import 'package:hop_pos/app/app_assets.dart';
import 'package:hop_pos/app/app_colors.dart';
import 'package:hop_pos/app/app_styles.dart';
import 'package:hop_pos/routes/screening_routes.dart';

class HeaderLogo extends StatelessWidget {
  const HeaderLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => ScreeningRoute().go(context),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Row(
            children: [
              Image.asset(
                AppAssets.logoSmall,
                fit: BoxFit.contain,
                width: 44,
              ),
              const SizedBox(width: 15),
              Text(
                'HOP POS',
                style: AppStyles.body.copyWith(
                  fontSize: 28,
                  color: AppColors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
