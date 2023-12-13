import 'package:dio/dio.dart';
import 'package:hop_pos/app/app_exceptions.dart';
import 'package:hop_pos/src/common/models/validation_errors.dart';

class ApiResponse {
  final Response response;

  ApiResponse(this.response) {
    checkValidationException();
    checkApiError();
    checkInvalidResponse();
  }

  get body {
    return response.data;
  }

  Map<String, dynamic> get data {
    return body['data'];
  }

  String? get message {
    return body['message'];
  }

  bool isError() {
    return body['result'] == 'error' && message != null;
  }

  void checkApiError() {
    if (!isError()) {
      return;
    }

    throw ApiError(message!);
  }

  void checkInvalidResponse() {
    if (response.statusCode! >= 200 && response.statusCode! < 300) {
      return;
    }

    throw ApiInvalidResponseError(
        'Status code: ${response.statusCode} ${body["message"]}');
  }

  void checkValidationException() {
    if (response.statusCode != 422 || body == null) {
      return;
    }

    throw ApiValidationError(
      body['message'],
      ValidationErrors(errors: body['errors']),
    );
  }
}
