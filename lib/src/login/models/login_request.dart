import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hop_pos/app/app_extension.dart';

part 'login_request.freezed.dart';

@freezed
class LoginRequest with _$LoginRequest {
  const factory LoginRequest({
    String? licenseKey,
    String? username,
    String? password,
  }) = _LoginRequest;

  factory LoginRequest.fromJson(Map<String, dynamic> json) =>
      _$LoginRequestFromJson(json);

  String? validateField(String field, String? value) {
    if (value.isNullOrEmpty) {
      return "$field is required";
    }

    return null;
  }
}
