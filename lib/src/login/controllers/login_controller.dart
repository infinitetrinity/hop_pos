import 'package:hop_pos/app/api_routes.dart';
import 'package:hop_pos/app/app_exceptions.dart';
import 'package:hop_pos/src/common/models/api_request.dart';
import 'package:hop_pos/src/common/models/api_response.dart';
import 'package:hop_pos/src/common/models/validation_errors.dart';
import 'package:hop_pos/src/common/services/api_service.dart';
import 'package:hop_pos/src/common/services/flash_message.dart';
import 'package:hop_pos/src/login/models/init_data_response.dart';
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
    FlashMessage flashMessage = ref.read(flashMessageProvider);
    ApiService api = ref.read(apiServiceProvider);

    try {
      ApiResponse? response = await api.post(
        ApiRequest(
          path: ApiRoutes.activateLicense,
          data: request.toJson(),
        ),
      );

      if (response != null) {
        await ref.read(syncingStateProvider.notifier).syncing();
        await _syncInitialisationData(LoginResponse.fromJson(response.data));
        await _downloadInitData();
        await ref.read(syncingStateProvider.notifier).syncing(isSyncing: false);
        flashMessage.flash(message: 'Initial sync completed.');
      }
    } catch (e, stackTrace) {
      if (e is ApiValidationError) {
        return e.errors;
      }
      if (e is ApiInvalidResponseError) {
        return ValidationErrors(errors: {
          'general': [e.message]
        });
      }
      final logger = Logger();
      logger.e("Login error", error: e, stackTrace: stackTrace);

      flashMessage.flash(
        message: 'Unexpected error in logging in',
        type: FlashMessageType.error,
      );

      await ref.read(syncingStateProvider.notifier).syncing(isSyncing: false);
    }

    return null;
  }

  Future<void> _downloadInitData({int page = 1}) async {
    print('Downloading page $page');
    FlashMessage flashMessage = ref.read(flashMessageProvider);
    ApiService api = ref.read(apiServiceProvider);

    try {
      ApiResponse? response = await api.post(
        ApiRequest(path: ApiRoutes.downloadInitData, data: {
          'page': page,
        }),
      );

      if (response != null) {
        LoginRepository repo = ref.read(loginRepoProvider);
        InitDataResponse initDataResponse =
            InitDataResponse.fromJson(response.data);
        await repo.setInitData(initDataResponse);

        if (initDataResponse.hasNextPage) {
          await _downloadInitData(page: page + 1);
        }
      }
    } catch (e, stackTrace) {
      final logger = Logger();
      logger.e("Download initial data error", error: e, stackTrace: stackTrace);

      flashMessage.flash(
        message: 'Unexpected error in syncing initial data',
        type: FlashMessageType.error,
      );

      rethrow;
    }
  }

  Future<void> _syncInitialisationData(LoginResponse response) async {
    FlashMessage flashMessage = ref.read(flashMessageProvider);

    try {
      LoginRepository repo = ref.read(loginRepoProvider);
      await repo.sync(response);
    } catch (e, stackTrace) {
      final logger = Logger();
      logger.e("Initial sync error", error: e, stackTrace: stackTrace);

      flashMessage.flash(
        message: 'Unexpected error in syncing data',
        type: FlashMessageType.error,
      );

      rethrow;
    }
  }
}
