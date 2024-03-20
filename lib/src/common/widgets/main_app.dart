import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hop_pos/app/app_routes.dart';
import 'package:hop_pos/routes/db_routes.dart';
import 'package:hop_pos/routes/login_routes.dart';
import 'package:hop_pos/src/common/widgets/auto_upgrader.dart';
import 'package:hop_pos/src/login/controllers/login_controller.dart';

class MainApp extends ConsumerWidget {
  const MainApp({super.key, required this.content});
  final Widget content;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final goRouter = ref.watch(goRouterProvider);

    void onCltrDPressed() {
      if (kDebugMode) {
        final isDbRoute = goRouter.routeInformationProvider.value.uri.path == DbScreenRoute().location;
        goRouter.go(isDbRoute ? LoginRoute().location : DbScreenRoute().location);
      }
    }

    void onCltrRPressed() async {
      await ref.read(loginControllerProvider.notifier).logout();
      if (context.mounted) {
        goRouter.go(LoginRoute().location);
      }
    }

    return Overlay(
      initialEntries: [
        OverlayEntry(
          builder: (context) => RawKeyboardListener(
            focusNode: FocusNode(),
            onKey: (RawKeyEvent event) {
              if (event is RawKeyDownEvent && event.logicalKey == LogicalKeyboardKey.keyD && event.isControlPressed) {
                onCltrDPressed();
              }
              if (event is RawKeyDownEvent && event.logicalKey == LogicalKeyboardKey.keyR && event.isControlPressed) {
                onCltrRPressed();
              }
            },
            child: Stack(
              children: [
                content,
                const AutoUpgrader(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
