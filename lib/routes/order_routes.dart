import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hop_pos/app/app_extension.dart';
import 'package:hop_pos/src/orders/screens/incomplete_orders_screen.dart';
import 'package:hop_pos/src/orders/screens/orders_screen.dart';
import 'package:window_manager/window_manager.dart';

part 'order_routes.g.dart';

@TypedGoRoute<OrderRoute>(
  path: '/orders',
  routes: [
    TypedGoRoute<IncompleteOrderRoute>(
      path: 'incomplete',
    ),
  ],
)
@immutable
class OrderRoute extends GoRouteData {
  @override
  FutureOr<String?> redirect(BuildContext context, GoRouterState state) async {
    await windowManager.setWindowTitle('Sales');
    return null;
  }

  @override
  NoTransitionPage buildPage(BuildContext context, GoRouterState state) {
    return NoTransitionPage(
      key: state.pageKey,
      child: const OrdersScreen(),
    );
  }
}

@immutable
class IncompleteOrderRoute extends GoRouteData {
  @override
  FutureOr<String?> redirect(BuildContext context, GoRouterState state) async {
    await windowManager.setWindowTitle('Incomplete Sales');
    return null;
  }

  @override
  NoTransitionPage buildPage(BuildContext context, GoRouterState state) {
    return NoTransitionPage(
      key: state.pageKey,
      child: const IncompleteOrdersScreen(),
    );
  }
}
