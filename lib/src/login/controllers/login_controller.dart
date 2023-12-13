import 'package:hop_pos/src/common/services/flash_message.dart';
import 'package:hop_pos/src/login/models/login_request.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'login_controller.g.dart';

@riverpod
class LoginController extends _$LoginController {
  @override
  void build() {
    return;
  }

  Future<void> login(LoginRequest request) async {
    FlashMessage flashMessage = ref.read(flashMessageProvider);
    flashMessage.flash(message: 'Testing', dismissible: false);
  }
}
