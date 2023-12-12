import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStyles {
  static TextStyle raleway = GoogleFonts.raleway(
      textStyle: const TextStyle(fontWeight: FontWeight.w400, height: 1));
  static TextStyle fraunces = GoogleFonts.fraunces(
      textStyle: const TextStyle(fontWeight: FontWeight.w600, height: 1));

  static TextStyle get h1 =>
      fraunces.copyWith(fontSize: 48, letterSpacing: -1, height: 1.17);
  static TextStyle get h2 =>
      h1.copyWith(fontSize: 24, letterSpacing: -.5, height: 1.16);
  static TextStyle get h3 =>
      h1.copyWith(fontSize: 14, letterSpacing: -.05, height: 1.29);
  static TextStyle get title1 =>
      raleway.copyWith(fontWeight: FontWeight.bold, fontSize: 16, height: 1.31);
  static TextStyle get title2 =>
      title1.copyWith(fontWeight: FontWeight.w500, fontSize: 14, height: 1.36);
  static TextStyle get body1 => raleway.copyWith(
      fontWeight: FontWeight.normal, fontSize: 14, height: 1.71);
  static TextStyle get body2 =>
      body1.copyWith(fontSize: 12, height: 1.5, letterSpacing: .2);
  static TextStyle get body3 =>
      body1.copyWith(fontSize: 12, height: 1.5, fontWeight: FontWeight.bold);
}
