import 'package:hop_pos/src/company/states/company_state.dart';
import 'package:hop_pos/src/login/actions/login_action.dart';
import 'package:hop_pos/src/login/models/login_request.dart';
import 'package:hop_pos/src/receipt_settings/states/receipt_setting_state.dart';
import 'package:hop_pos/src/users/states/auth_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'login_controller.g.dart';

@riverpod
class LoginController extends _$LoginController {
  @override
  FutureOr<void> build() {}

  _reset() {
    ref.invalidate(authStateProvider);
    ref.invalidate(companyStateProvider);
    ref.invalidate(receiptSettingStateProvider);
  }

  Future<bool> login(LoginRequest request) async {
    final loginAction = ref.read(loginActionProvider);
    state = await AsyncValue.guard(() => loginAction.login(request));
    return state.hasError ? false : true;
  }

  Future<void> logout() async {
    await ref.read(loginActionProvider).logout();
    _reset();
  }
}
