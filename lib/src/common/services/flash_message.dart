import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hop_pos/app/app_colors.dart';
import 'package:hop_pos/app/app_global.dart';
import 'package:hop_pos/src/common/widgets/flash_content.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'flash_message.g.dart';

enum FlashMessageType { error, success }

@riverpod
FlashMessage flashMessage(FlashMessageRef ref) {
  return FlashMessage();
}

class FlashMessage {
  final String? header;
  final String? message;
  final FlashMessageType? type;
  final bool? dismissible;

  FlashMessage({
    this.header,
    this.message,
    this.type,
    this.dismissible,
  });

  void flash({
    required String message,
    String? header,
    FlashMessageType? type = FlashMessageType.success,
    bool? dismissible = true,
  }) {
    final FlashMessage flash = FlashMessage(
      message: message,
      header: header,
      type: type!,
      dismissible: dismissible!,
    );

    FToast fToast = FToast();
    fToast.init(navigatorKey.currentContext!);
    fToast.removeCustomToast();

    fToast.showToast(
      child: FlashContent(message: flash),
      toastDuration: Duration(seconds: dismissible ? 3 : 15),
      positionedToastBuilder: (context, child) {
        return Positioned(
          top: 20,
          left: MediaQuery.of(context).size.width * 0.5 - 250,
          child: child,
        );
      },
    );
  }

  Color get bgColor {
    return switch (type) {
      FlashMessageType.success => AppColors.green600,
      FlashMessageType.error => AppColors.red600,
      _ => AppColors.blue500,
    };
  }

  String get headerText {
    if (header != null) {
      return header!;
    }

    return switch (type) {
      FlashMessageType.success => 'Success',
      FlashMessageType.error => 'Error',
      _ => 'Info',
    };
  }
}
