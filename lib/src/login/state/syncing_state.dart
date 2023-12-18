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
}
