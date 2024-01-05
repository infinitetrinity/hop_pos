// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_routes.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $orderRoute,
    ];

RouteBase get $orderRoute => GoRouteData.$route(
      path: '/orders',
      factory: $OrderRouteExtension._fromState,
      routes: [
        GoRouteData.$route(
          path: 'incomplete',
          factory: $IncompleteOrderRouteExtension._fromState,
        ),
      ],
    );

extension $OrderRouteExtension on OrderRoute {
  static OrderRoute _fromState(GoRouterState state) => OrderRoute();

  String get location => GoRouteData.$location(
        '/orders',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $IncompleteOrderRouteExtension on IncompleteOrderRoute {
  static IncompleteOrderRoute _fromState(GoRouterState state) =>
      IncompleteOrderRoute();

  String get location => GoRouteData.$location(
        '/orders/incomplete',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
