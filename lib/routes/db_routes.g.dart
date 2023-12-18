// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db_routes.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $dbScreenRoute,
    ];

RouteBase get $dbScreenRoute => GoRouteData.$route(
      path: '/db',
      factory: $DbScreenRouteExtension._fromState,
    );

extension $DbScreenRouteExtension on DbScreenRoute {
  static DbScreenRoute _fromState(GoRouterState state) => DbScreenRoute();

  String get location => GoRouteData.$location(
        '/db',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
