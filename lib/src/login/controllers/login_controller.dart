import 'package:hop_pos/src/common/models/api_request.dart';
import 'package:hop_pos/src/common/services/api_service.dart';
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
    ApiService api = ref.read(apiServiceProvider);
    await api.get(const ApiRequest(path: '/license-activation'));
  }
}
