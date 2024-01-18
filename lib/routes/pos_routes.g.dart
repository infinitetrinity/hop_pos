// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pos_routes.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $posRoute,
    ];

RouteBase get $posRoute => GoRouteData.$route(
      path: '/pos',
      factory: $PosRouteExtension._fromState,
    );

extension $PosRouteExtension on PosRoute {
  static PosRoute _fromState(GoRouterState state) => PosRoute();

  String get location => GoRouteData.$location(
        '/pos',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
