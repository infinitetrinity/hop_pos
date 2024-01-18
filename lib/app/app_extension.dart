import 'package:flutter/material.dart';
import 'package:hop_pos/app/app_colors.dart';
import 'package:intl/intl.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:window_manager/window_manager.dart';

extension ContextExtensions on BuildContext {
  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  TextTheme get textTheme => Theme.of(this).textTheme;
}

extension WindowManagerExtension on WindowManager {
  Future<void> setWindowTitle(String title) async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String version = packageInfo.version;
    await setTitle("$title | Health Outreach POS V$version");
  }
}

extension NullableStringValidation on String? {
  bool get isNullOrEmpty {
    return this == null || this!.trim().isEmpty;
  }
}

extension DoubleExtensions on double {
  String get formatMoney {
    return NumberFormat.simpleCurrency().format(this);
  }
}

extension StringColorExtensions on String? {
  Color get parseColor {
    if (isNullOrEmpty) {
      return AppColors.brand600;
    }

    final color = this!.toLowerCase().trim();

    if (color.startsWith('rgba')) {
      RegExp regex = RegExp(r'rgba\((\d+), (\d+), (\d+), ([\d.]+)\)');
      Match match = regex.firstMatch(color)!;

      int red = int.parse(match.group(1)!);
      int green = int.parse(match.group(2)!);
      int blue = int.parse(match.group(3)!);
      double opacity = double.parse(match.group(4)!);

      return Color.fromRGBO(red, green, blue, opacity);
    } else if (color == 'red') {
      return AppColors.red600;
    } else if (color == 'grey') {
      return AppColors.gray500;
    } else if (color == 'green') {
      return AppColors.green500;
    } else if (color.startsWith('#') && color.length == 7) {
      return Color(int.parse(color.substring(1), radix: 16) + 0xFF000000);
    }

    return AppColors.brand600;
  }
}
