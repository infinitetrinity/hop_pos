import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hop_pos/app/app_routes.dart';
import 'package:hop_pos/routes/db_routes.dart';
import 'package:hop_pos/routes/login_routes.dart';
import 'package:hop_pos/src/common/services/setup_service.dart';
import 'package:hop_pos/src/common/widgets/logo_loading.dart';

class MainApp extends HookConsumerWidget {
  const MainApp({super.key, required this.content});
  final Widget content;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isResetting = useState(false);

    void onCltrDPressed() {
      if (kDebugMode) {
        final router = ref.read(goRouterProvider);
        router.routerDelegate.currentConfiguration.uri.path == DbScreenRoute().location
            ? router.go(LoginRoute().location)
            : router.go(DbScreenRoute().location);
      }
    }

    void onCltrRPressed() async {
      isResetting.value = true;
      await ref.read(setupServiceProvider.notifier).resetApp();
      isResetting.value = false;
      final router = ref.read(goRouterProvider);
      router.go(LoginRoute().location);
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
            child: isResetting.value ? const LogoLoading() : content,
          ),
        ),
      ],
    );
  }
}
