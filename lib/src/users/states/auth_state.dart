import 'package:hop_pos/src/common/services/auth_token.dart';
import 'package:hop_pos/src/users/models/user.dart';
import 'package:hop_pos/src/users/repositories/user_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_state.g.dart';

@riverpod
class AuthState extends _$AuthState {
  @override
  User? build() {
    return null;
  }

  init() async {
    UserRepository repo = ref.watch(userRepoProvider);
    User? user = await repo.getFirst();
    state = user;
  }

  reset() {
    state = null;
  }

  login(User user, String accessToken) async {
    state = user;
    await AuthToken.setAuthToken(accessToken);
  }

  Future<bool> isLogin() async {
    final token = await AuthToken.getAuthToken();
    return state != null && token != null;
  }
}
