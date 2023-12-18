import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hop_pos/src/common/screens/db_screen.dart';

part 'db_routes.g.dart';

@TypedGoRoute<DbScreenRoute>(
  path: '/db',
)
@immutable
class DbScreenRoute extends GoRouteData {
  @override
  NoTransitionPage buildPage(BuildContext context, GoRouterState state) {
    return NoTransitionPage(
      key: state.pageKey,
      child: const DbScreen(),
    );
  }
}
