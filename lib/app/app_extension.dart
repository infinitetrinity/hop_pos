import 'package:flutter/material.dart';
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
