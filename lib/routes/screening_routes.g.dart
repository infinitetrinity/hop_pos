// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'screening_routes.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $screeningRoute,
    ];

RouteBase get $screeningRoute => GoRouteData.$route(
      path: '/screening',
      factory: $ScreeningRouteExtension._fromState,
    );

extension $ScreeningRouteExtension on ScreeningRoute {
  static ScreeningRoute _fromState(GoRouterState state) => ScreeningRoute();

  String get location => GoRouteData.$location(
        '/screening',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
