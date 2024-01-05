import 'dart:async';

import 'package:hop_pos/src/common/services/api_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'server_connection_state.g.dart';

@Riverpod(keepAlive: true)
class SeverConnectionState extends _$SeverConnectionState {
  Timer? _timer;

  @override
  Future<bool> build() async {
    activateCheckConnectionTimer();
    return await checkServerConnection();
  }

  FutureOr<bool> checkServerConnection() async {
    state = const AsyncLoading();
    ApiService api = ref.read(apiServiceProvider);
    final result = await api.checkServerConnection();
    state = AsyncValue.data(result);
    return result;
  }

  void activateCheckConnectionTimer() {
    _timer = Timer.periodic(const Duration(minutes: 2), (timer) async {
      state = AsyncValue.data(await checkServerConnection());
    });

    ref.onDispose(() {
      _timer?.cancel();
    });
  }
}
