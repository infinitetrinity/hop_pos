import 'package:go_router/go_router.dart';
import 'package:hop_pos/routes/home_routes.dart';
import 'package:hop_pos/routes/login_routes.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_routes.g.dart';

@riverpod
GoRouter goRouter(GoRouterRef ref) {
  return GoRouter(
    routes: [
      $loginRoute,
      $homeRoute,
    ],
  );
}
