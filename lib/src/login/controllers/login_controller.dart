import 'package:hop_pos/app/app_db.dart';
import 'package:hop_pos/app/app_exceptions.dart';
import 'package:hop_pos/src/common/models/api_request.dart';
import 'package:hop_pos/src/common/models/api_response.dart';
import 'package:hop_pos/src/common/models/validation_errors.dart';
import 'package:hop_pos/src/common/services/api_service.dart';
import 'package:hop_pos/src/common/services/flash_message.dart';
import 'package:hop_pos/src/login/models/login_request.dart';
import 'package:hop_pos/src/login/responses/login_response.dart';
import 'package:hop_pos/src/login/state/syncing_state.dart';
import 'package:hop_pos/src/users/repositories/user_repository.dart';
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
        await _syncInitialisationData(LoginResponse(response));
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

    try {
      final db = ref.watch(appDbProvider);
      //await db.deleteDb();
      await ref.read(syncingStateProvider.notifier).syncing();

      UserRepository userRepo = ref.read(userRepoProvider);

      await userRepo.insert(response.userData);
      flashMessage.flash(message: 'Initial sync completed.');
      await ref.read(syncingStateProvider.notifier).syncing(isSyncing: false);
    } catch (e, stackTrace) {
      await ref.read(syncingStateProvider.notifier).syncing(isSyncing: false);
      final logger = Logger();
      logger.e("Initial sync error", error: e, stackTrace: stackTrace);

      flashMessage.flash(
        message: 'Unexpected Error',
        type: FlashMessageType.error,
      );
    }
  }
}
