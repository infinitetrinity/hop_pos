import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hop_pos/src/common/models/validation_errors.dart';

part 'app_exceptions.freezed.dart';

@freezed
class AppException with _$AppException {
  const factory AppException.noInternetError(String message) = NoInternetError;
  const factory AppException.apiServerConnectionError(String message) = ApiServerConnectionError;
  const factory AppException.apiValidationError(String message, ValidationErrors errors) = ApiValidationError;
  const factory AppException.apiError(String message) = ApiError;
  const factory AppException.apiUnauthenticatedError(String message) = ApiUnauthenticatedError;
  const factory AppException.apiInvalidResponseError(String message) = ApiInvalidResponseError;
  const factory AppException.unexpectedError(dynamic message, dynamic stack) = UnexpectedError;
  const factory AppException.validationError() = ValidationError;
}
