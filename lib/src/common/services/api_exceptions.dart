import 'dart:async';

import 'package:hop_pos/app/app_exceptions.dart';
import 'package:hop_pos/src/common/services/flash_message.dart';
import 'package:logger/logger.dart';

class ApiExceptions {
  ApiExceptions();
  static bool isHandled = false;
  static FlashMessage flashMessage = FlashMessage();

  static bool handle(dynamic exception) {
    if (_handleNoInternetConnection(exception)) {
      return true;
    }
    if (_handleTimeoutOutError(exception)) {
      return true;
    }

    _handleApiValidationError(exception);
    _handleApiError(exception);
    _handleApiInvalidResponse(exception);
    if (!isHandled) {
      _handleApiUnknownError(exception);
    }

    return false;
  }

  static bool _handleNoInternetConnection(exception) {
    if (exception is! NoInternetError) {
      return false;
    }

    flashMessage.flash(
      message: 'No internet connection.',
      type: FlashMessageType.error,
    );
    return true;
  }

  static bool _handleTimeoutOutError(exception) {
    if (exception is! TimeoutException && exception.toString() != "Connection timed out") {
      return false;
    }

    flashMessage.flash(
      message: "Error connecting to server, please try again later",
      type: FlashMessageType.error,
    );
    return true;
  }

  static void _handleApiValidationError(exception) {
    if (exception is! ApiValidationError) {
      return;
    }

    isHandled = true;
    flashMessage.flash(
      message: exception.message,
      type: FlashMessageType.error,
    );
  }

  static void _handleApiError(exception) {
    if (exception is! ApiError) {
      return;
    }

    flashMessage.flash(
      message: "API Error: ${exception.message}",
      type: FlashMessageType.error,
    );
    isHandled = true;
  }

  static void _handleApiInvalidResponse(exception) {
    if (exception is! ApiInvalidResponseError) {
      return;
    }

    final logger = Logger();
    logger.e("Api Invalid response error.", error: exception);
    isHandled = true;
  }

  static void _handleApiUnknownError(exception) {
    final logger = Logger();
    logger.e("Api unknown error", error: exception);
  }
}
