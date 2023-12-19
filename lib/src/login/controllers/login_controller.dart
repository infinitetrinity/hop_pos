import 'package:hop_pos/app/app_exceptions.dart';
import 'package:hop_pos/src/common/models/api_request.dart';
import 'package:hop_pos/src/common/models/api_response.dart';
import 'package:hop_pos/src/common/models/validation_errors.dart';
import 'package:hop_pos/src/common/services/api_service.dart';
import 'package:hop_pos/src/common/services/flash_message.dart';
import 'package:hop_pos/src/login/models/login_request.dart';
import 'package:hop_pos/src/login/models/login_response.dart';
import 'package:hop_pos/src/login/repositories/login_repository.dart';
import 'package:hop_pos/src/login/state/syncing_state.dart';
import 'package:logger/logger.dart';
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

      if (response != null) {
        await _syncInitialisationData(LoginResponse.fromJson(response.data));
      }
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

  Future<void> _syncInitialisationData(LoginResponse response) async {
    FlashMessage flashMessage = ref.read(flashMessageProvider);
    await ref.read(syncingStateProvider.notifier).syncing();

    try {
      LoginRepository repo = ref.read(loginRepoProvider);
      await repo.sync(response);
      flashMessage.flash(message: 'Initial sync completed.');
    } catch (e, stackTrace) {
      final logger = Logger();
      logger.e("Initial sync error", error: e, stackTrace: stackTrace);

      flashMessage.flash(
        message: 'Unexpected Error',
        type: FlashMessageType.error,
      );
    }

    await ref.read(syncingStateProvider.notifier).syncing(isSyncing: false);
  }
}
