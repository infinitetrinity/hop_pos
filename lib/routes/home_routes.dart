import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hop_pos/app/app_extension.dart';
import 'package:hop_pos/src/home/screens/home_screen.dart';
import 'package:window_manager/window_manager.dart';

part 'home_routes.g.dart';

@TypedGoRoute<HomeRoute>(
  path: '/home',
)
@immutable
class HomeRoute extends GoRouteData {
  @override
  FutureOr<String?> redirect(BuildContext context, GoRouterState state) async {
    await windowManager.setWindowTitle('POS');
    return null;
  }

  @override
  NoTransitionPage buildPage(BuildContext context, GoRouterState state) {
    return NoTransitionPage(
      key: state.pageKey,
      child: const HomeScreen(),
    );
  }
}
