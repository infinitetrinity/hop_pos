import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hop_pos/src/home/screens/home_screen.dart';

part 'home_routes.g.dart';

@TypedGoRoute<HomeRoute>(
  path: '/',
)
@immutable
class HomeRoute extends GoRouteData {
  @override
  NoTransitionPage buildPage(BuildContext context, GoRouterState state) {
    return NoTransitionPage(
      key: state.pageKey,
      child: const HomeScreen(),
    );
  }
}
