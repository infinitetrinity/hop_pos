import 'package:hop_pos/src/login/repositories/login_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'syncing_state.g.dart';

@riverpod
class SyncingState extends _$SyncingState {
  @override
  bool build() {
    return false;
  }

  syncing({bool isSyncing = true}) {
    state = isSyncing;
  }

  synced() async {
    LoginRepository repo = ref.read(loginRepoProvider);
    await repo.synced();
    state = true;
  }
}
