import 'dart:async';

import 'package:hop_pos/src/common/services/api_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'server_connection_state.g.dart';

@Riverpod(keepAlive: true)
Stream<bool> serverConnectionState(ServerConnectionStateRef ref) {
  ApiService api = ref.read(apiServiceProvider);
  final controller = StreamController<bool>();
  controller.add(false);

  Timer.run(() async {
    controller.add(await api.checkServerConnection());
  });

  final timer = Timer.periodic(const Duration(seconds: 30), (timer) async {
    controller.add(await api.checkServerConnection());
  });

  ref.onDispose(() {
    controller.close();
    timer.cancel();
  });

  return controller.stream;
}
