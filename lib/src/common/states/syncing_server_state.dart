import 'dart:async';

import 'package:hop_pos/src/common/actions/syncing_action.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'syncing_server_state.g.dart';

@Riverpod(keepAlive: true)
class SyncingServerState extends _$SyncingServerState {
  Timer? _timer;

  @override
  Future<bool> build() async {
    //syncingServerTimer();
    return true;
    //return await syncingServer();
  }

  FutureOr<bool> syncingServer() async {
    print('syncing server');
    state = const AsyncLoading();
    final result = await ref.read(syncingActionProvider).syncServerData();
    state = AsyncValue.data(result);
    return result;
  }

  void syncingServerTimer() {
    _timer = Timer.periodic(const Duration(minutes: 4), (timer) async {
      state = AsyncValue.data(await syncingServer());
    });

    ref.onDispose(() {
      _timer?.cancel();
    });
  }
}
