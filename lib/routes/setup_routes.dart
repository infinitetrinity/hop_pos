import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hop_pos/app/app_extension.dart';
import 'package:hop_pos/src/setup/screens/setup_screen.dart';
import 'package:window_manager/window_manager.dart';

part 'setup_routes.g.dart';

@TypedGoRoute<SetupRoute>(
  path: '/',
)
@immutable
class SetupRoute extends GoRouteData {
  @override
  FutureOr<String?> redirect(BuildContext context, GoRouterState state) async {
    await windowManager.setWindowTitle('Setting up');
    return null;
  }

  @override
  NoTransitionPage buildPage(BuildContext context, GoRouterState state) {
    return NoTransitionPage(
      key: state.pageKey,
      child: const SetupScreen(),
    );
  }
}
