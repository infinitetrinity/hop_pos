import 'package:hop_pos/src/common/services/auth_token.dart';
import 'package:hop_pos/src/users/models/user.dart';
import 'package:hop_pos/src/users/repositories/user_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_actions.g.dart';

@riverpod
UserActions userActions(UserActionsRef ref) {
  return UserActions(
    userRepo: ref.watch(userRepoProvider),
  );
}

class UserActions {
  final UserRepository userRepo;

  UserActions({
    required this.userRepo,
  });

  Future<User?> getFirst() async {
    String? token = await AuthToken.getAuthToken();
    return token == null ? null : await userRepo.getFirst();
  }

  Future<void> login(User user, String accessToken) async {
    await AuthToken.deleteAuthToken();
    await AuthToken.setAuthToken(accessToken);
  }

  Future<void> logout() async {
    await AuthToken.deleteAuthToken();
  }

  Future<void> updateLastSyncedNow() async {
    await userRepo.updateLastSyncedNow();
  }
}
