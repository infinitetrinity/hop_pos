import 'dart:async';

import 'package:hop_pos/app/app_exceptions.dart';
import 'package:hop_pos/src/common/services/flash_message.dart';
import 'package:logger/logger.dart';

class ApiExceptions {
  ApiExceptions();
  static bool errorHandled = false;
  static FlashMessage flashMessage = FlashMessage();

  static void handle(dynamic exception) {
    errorHandled = false;
    _handleNoInternetConnection(exception);
    _handleTimeoutOutError(exception);
    _handleApiValidationError(exception);
    _handleApiError(exception);
    _handleApiInvalidResponse(exception);

    if (!errorHandled) {
      _handleApiUnknownError(exception);
    }
  }

  static void _handleNoInternetConnection(exception) {
    if (exception is! NoInternetError) {
      return;
    }

    errorHandled = true;
    flashMessage.flash(
      message: 'No internet connection.',
      type: FlashMessageType.error,
    );
  }

  static void _handleTimeoutOutError(exception) {
    if (exception is! TimeoutException && exception.toString() != "Connection timed out") {
      return;
    }

    errorHandled = true;
    flashMessage.flash(
      message: "Error connecting to server, please try again later",
      type: FlashMessageType.error,
    );
  }

  static void _handleApiValidationError(exception) {
    if (exception is! ApiValidationError) {
      return;
    }

    errorHandled = true;
    flashMessage.flash(
      message: exception.message,
      type: FlashMessageType.error,
    );
  }

  static void _handleApiError(exception) {
    if (exception is! ApiError) {
      return;
    }

    errorHandled = true;
    flashMessage.flash(
      message: "API Error: ${exception.message}",
      type: FlashMessageType.error,
    );
  }

  static void _handleApiInvalidResponse(exception) {
    if (exception is! ApiInvalidResponseError) {
      return;
    }

    errorHandled = true;
    final logger = Logger();
    logger.e("Api Invalid response error.", error: exception);
  }

  static void _handleApiUnknownError(exception) {
    final logger = Logger();
    logger.e("Api unknown error", error: exception);
  }
}
