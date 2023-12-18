import 'package:hop_pos/app/app_exceptions.dart';
import 'package:hop_pos/src/common/models/api_request.dart';
import 'package:hop_pos/src/common/models/api_response.dart';
import 'package:hop_pos/src/common/models/validation_errors.dart';
import 'package:hop_pos/src/common/services/api_service.dart';
import 'package:hop_pos/src/login/models/login_request.dart';
import 'package:hop_pos/src/login/responses/login_response.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'login_controller.g.dart';

@riverpod
class LoginController extends _$LoginController {
  @override
  void build() {
    return;
  }

  Future<ValidationErrors?> login(LoginRequest request) async {
    ApiService api = ref.read(apiServiceProvider);

    try {
      ApiResponse? response = await api.post(
        ApiRequest(
          path: 'license-activation',
          data: request.toJson(),
        ),
      );

      final data = LoginResponse(response!);
      print(data.user);

      //ref.read(syncingStateProvider.notifier).sync(response!.data);
    } catch (e) {
      if (e is ApiValidationError) {
        return e.errors;
      }
      if (e is ApiInvalidResponseError) {
        return ValidationErrors(errors: {
          'general': [e.message]
        });
      }
    }

    return null;
  }
}
