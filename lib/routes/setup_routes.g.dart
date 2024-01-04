// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'setup_routes.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $setupRoute,
    ];

RouteBase get $setupRoute => GoRouteData.$route(
      path: '/',
      factory: $SetupRouteExtension._fromState,
    );

extension $SetupRouteExtension on SetupRoute {
  static SetupRoute _fromState(GoRouterState state) => SetupRoute();

  String get location => GoRouteData.$location(
        '/',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
