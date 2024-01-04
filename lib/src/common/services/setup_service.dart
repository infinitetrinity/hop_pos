import 'package:hop_pos/app/app_db.dart';
import 'package:hop_pos/src/common/services/auth_token.dart';
import 'package:hop_pos/src/users/states/auth_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'setup_service.g.dart';

@riverpod
class SetupService extends _$SetupService {
  @override
  void build() async {
    return;
  }

  Future<void> setupApp() async {
    print('setting up');
    await ref.read(authStateProvider.notifier).init();
  }

  Future<void> resetApp() async {
    print('reset app');
    await AuthToken.deleteAuthToken();
    await ref.read(authStateProvider.notifier).reset();
    await ref.read(appDbProvider).deleteDb();
  }
}
