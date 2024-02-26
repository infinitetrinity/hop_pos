import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hop_pos/app/app_colors.dart';
import 'package:hop_pos/app/app_exceptions.dart';
import 'package:hop_pos/src/common/services/flash_message.dart';
import 'package:intl/intl.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
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

extension StringValidation on String {
  bool get isAlphaNumeric {
    final validCharacters = RegExp(r'^[a-zA-Z0-9]+$');
    return validCharacters.hasMatch(this);
  }

  bool get isNumeric {
    final validCharacters = RegExp(r'^[0-9]+$');
    return validCharacters.hasMatch(this);
  }

  bool get isEmail {
    final validCharacters = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return validCharacters.hasMatch(this);
  }
}

extension DoubleExtensions on double {
  String get formatMoney {
    return NumberFormat.simpleCurrency().format(this);
  }

  double toDecimalPlace(int n) => double.parse(toStringAsFixed(n));

  double percentageOf(double percent) {
    return percent / 100 * this;
  }

  double roundDownTo5Cents() {
    return (this * 20).floor() / 20;
  }

  String removeZeroDecimal() {
    String result = toString();
    if (result.endsWith('.0')) {
      result = result.substring(0, result.length - 2);
    }

    return result;
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

extension ColorExtensions on Color {
  String get hex {
    return "#${value.toRadixString(16).substring(2)}";
  }
}

extension AsyncValueExtensions on AsyncValue {
  void flashError(FlashMessage flashMessage) {
    if (!isLoading &&
        hasError &&
        error is! NoInternetError &&
        error is! TimeoutException &&
        error is! ApiValidationError) {
      String? errorMessage;
      if (error is AppException) {
        try {
          errorMessage = (error as dynamic).message as String;
        } catch (_) {}
      }

      errorMessage = errorMessage ?? error.toString();
      flashMessage.flash(message: errorMessage, type: FlashMessageType.error);
    }
  }
}
