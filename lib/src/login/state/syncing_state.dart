import 'package:hop_pos/src/login/models/syncing_progress.dart';
import 'package:hop_pos/src/login/repositories/login_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'syncing_state.g.dart';

@riverpod
class SyncingState extends _$SyncingState {
  @override
  SyncingProgress build() {
    return const SyncingProgress(isSyncing: false, currentPage: 0, lastPage: 0);
  }

  syncing({
    bool isSyncing = true,
    int? currentPage,
    int? lastPage,
  }) {
    state = state.copyWith(
      isSyncing: isSyncing,
      currentPage: currentPage ?? 0,
      lastPage: lastPage ?? 0,
    );
  }

  synced() async {
    LoginRepository repo = ref.read(loginRepoProvider);
    await repo.synced();
    state = state.copyWith(isSyncing: false);
  }
}
