import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hop_pos/app/app_extension.dart';
import 'package:hop_pos/src/Login/screens/Login_screen.dart';
import 'package:window_manager/window_manager.dart';

part 'login_routes.g.dart';

@TypedGoRoute<LoginRoute>(
  path: '/',
)
@immutable
class LoginRoute extends GoRouteData {
  @override
  FutureOr<String?> redirect(BuildContext context, GoRouterState state) async {
    await windowManager.setWindowTitle('License Activation');
    return null;
  }

  @override
  NoTransitionPage buildPage(BuildContext context, GoRouterState state) {
    return NoTransitionPage(
      key: state.pageKey,
      child: const LoginScreen(),
    );
  }
}
