import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hop_pos/app/app_extension.dart';
import 'package:hop_pos/src/pos/screens/pos_screen.dart';
import 'package:window_manager/window_manager.dart';

part 'pos_routes.g.dart';

@TypedGoRoute<PosRoute>(
  path: '/pos',
)
@immutable
class PosRoute extends GoRouteData {
  @override
  FutureOr<String?> redirect(BuildContext context, GoRouterState state) async {
    await windowManager.setWindowTitle('POS');
    return null;
  }

  @override
  NoTransitionPage buildPage(BuildContext context, GoRouterState state) {
    return NoTransitionPage(
      key: state.pageKey,
      child: const PosScreen(),
    );
  }
}
