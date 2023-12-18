import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hop_pos/app/app_routes.dart';
import 'package:hop_pos/routes/db_routes.dart';
import 'package:hop_pos/routes/login_routes.dart';

class MainApp extends ConsumerWidget {
  const MainApp({super.key, required this.content});
  final Widget content;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void onCltrDPressed() {
      final router = ref.read(goRouterProvider);

      router.routeInformationProvider.value.uri.toString() == '/db'
          ? router.go(LoginRoute().location)
          : router.go(DbScreenRoute().location);
    }

    return Overlay(
      initialEntries: [
        OverlayEntry(
          builder: (context) => Shortcuts(
            shortcuts: {
              LogicalKeySet(
                LogicalKeyboardKey.control,
                LogicalKeyboardKey.keyD,
              ): const ActivateIntent(),
            },
            child: Actions(
              actions: {
                ActivateIntent: CallbackAction<ActivateIntent>(
                  onInvoke: (ActivateIntent intent) {
                    onCltrDPressed();
                    return null;
                  },
                ),
              },
              child: content,
            ),
          ),
        ),
      ],
    );
  }
}
