import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hop_pos/src/common/models/validation_errors.dart';

part 'app_exceptions.freezed.dart';

@freezed
class AppException with _$AppException {
  const factory AppException.noInternetError() = NoInternetError;
  const factory AppException.apiServerConnectionError() =
      ApiServerConnectionError;
  const factory AppException.apiValidationError(
      String message, ValidationErrors errors) = ApiValidationError;
  const factory AppException.apiError(String message) = ApiError;
  const factory AppException.apiInvalidResponseError(String message) =
      ApiInvalidResponseError;
  const factory AppException.unexpectedError(dynamic message, dynamic stack) =
      UnexpectedError;
  const factory AppException.validationError() = ValidationError;
}
