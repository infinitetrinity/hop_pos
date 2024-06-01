import 'dart:async';

import 'package:go_router/go_router.dart';
import 'package:hop_pos/app/app_exceptions.dart';
import 'package:hop_pos/app/app_logger.dart';
import 'package:hop_pos/routes/login_routes.dart';
import 'package:hop_pos/src/common/services/flash_message.dart';

class ApiExceptions {
  ApiExceptions();
  static FlashMessage flashMessage = FlashMessage();

  static void handle(dynamic exception, StackTrace stackTrace, GoRouter goRouter) {
    _handleNoInternetConnection(exception);
    _handleTimeoutOutError(exception);
    _handleApiUnauthenticatedError(exception, goRouter);
    _handleApiValidationError(exception);
    _handleApiError(exception);
    _handleApiInvalidResponse(exception, stackTrace);
  }

  static void _handleNoInternetConnection(exception) {
    if (exception is! NoInternetError) {
      return;
    }

    flashMessage.flash(
      message: 'No internet connection.',
      type: FlashMessageType.error,
    );
  }

  static void _handleTimeoutOutError(exception) {
    if (exception is! TimeoutException && exception.toString() != "Connection timed out") {
      return;
    }

    flashMessage.flash(
      message: "Error connecting to server, please try again later",
      type: FlashMessageType.error,
    );
  }

  static void _handleApiUnauthenticatedError(exception, GoRouter goRouter) {
    if (exception is! ApiUnauthenticatedError) {
      return;
    }

    flashMessage.flash(
      message: "Your token has expired, please login again.",
      type: FlashMessageType.error,
    );

    goRouter.go(ReauthenticateRoute().location);
  }

  static void _handleApiValidationError(exception) {
    if (exception is! ApiValidationError) {
      return;
    }

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
  }

  static void _handleApiInvalidResponse(exception, StackTrace stackTrace) {
    if (exception is! ApiInvalidResponseError) {
      return;
    }

    AppLogger().e("Api Invalid response error", error: exception, stackTrace: stackTrace);
  }
}
