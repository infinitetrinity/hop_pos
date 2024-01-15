import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hop_pos/app/app_colors.dart';

class AppStyles {
  static TextStyle raleway = GoogleFonts.raleway(textStyle: const TextStyle(fontWeight: FontWeight.w400, height: 1));
  static TextStyle fraunces = GoogleFonts.fraunces(textStyle: const TextStyle(fontWeight: FontWeight.w600, height: 1));

  static TextStyle get h1 => fraunces.copyWith(
        fontSize: 48,
        letterSpacing: -1,
        height: 1.17,
      );
  static TextStyle get body => raleway.copyWith(
        fontWeight: FontWeight.w600,
        fontSize: 14,
        height: 1.5,
        color: AppColors.gray700,
      );
  static TextStyle get bodySmall => body.copyWith(
        fontSize: 12,
        height: 1.5,
        letterSpacing: .2,
      );
  static TextStyle get bodyMedium => body.copyWith(
        fontSize: 16,
      );
}
