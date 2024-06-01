import 'package:dio/dio.dart';
import 'package:hop_pos/app/app_exceptions.dart';
import 'package:hop_pos/src/common/models/validation_errors.dart';

class ApiResponse {
  final Response response;
  final bool supressError;

  ApiResponse({
    required this.response,
    this.supressError = false,
  }) {
    if (supressError) {
      return;
    }

    checkApiUnauthenticatedError();
    checkValidationException();
    checkApiError();
    checkInvalidResponse();
  }

  Map<String, dynamic>? get body {
    return response.data is Map<String, dynamic> ? response.data : null;
  }

  Map<String, dynamic>? get data {
    return body?['data'];
  }

  String? get message {
    return body?['message'];
  }

  String? get result {
    return body?['result'];
  }

  Map<String, dynamic>? get errors {
    return body?['errors'];
  }

  void checkApiError() {
    if (result == 'error' && message != null) {
      throw ApiError(message!);
    }
  }

  void checkApiUnauthenticatedError() {
    if (response.statusCode! == 401) {
      throw ApiUnauthenticatedError(message ?? 'Api Unauthenticated');
    }
  }

  void checkInvalidResponse() {
    if (response.statusCode! >= 200 && response.statusCode! < 300) {
      return;
    }

    throw ApiInvalidResponseError(message ?? 'Api invalid');
  }

  void checkValidationException() {
    if (response.statusCode != 422 || errors == null) {
      return;
    }

    throw ApiValidationError(
      message ?? 'Api validation error',
      ValidationErrors(errors: errors!),
    );
  }
}
