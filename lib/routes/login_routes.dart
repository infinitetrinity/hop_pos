import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hop_pos/src/Login/screens/Login_screen.dart';

part 'login_routes.g.dart';

@TypedGoRoute<LoginRoute>(
  path: '/',
)
@immutable
class LoginRoute extends GoRouteData {
  @override
  NoTransitionPage buildPage(BuildContext context, GoRouterState state) {
    return NoTransitionPage(
      key: state.pageKey,
      child: const LoginScreen(),
    );
  }
}
