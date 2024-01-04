import 'package:go_router/go_router.dart';
import 'package:hop_pos/app/app_global.dart';
import 'package:hop_pos/routes/db_routes.dart';
import 'package:hop_pos/routes/home_routes.dart';
import 'package:hop_pos/routes/login_routes.dart';
import 'package:hop_pos/routes/setup_routes.dart';
import 'package:hop_pos/src/users/states/auth_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_routes.g.dart';

@riverpod
GoRouter goRouter(GoRouterRef ref) {
  return GoRouter(
    navigatorKey: navigatorKey,
    routes: [
      $dbScreenRoute,
      $setupRoute,
      $loginRoute,
      $homeRoute,
    ],
    redirect: (context, state) async {
      bool isAuthenticated = await ref.watch(authStateProvider.notifier).isLogin();
      List<String> ignoreRoutes = [DbScreenRoute().location, SetupRoute().location];

      if (ignoreRoutes.contains(state.fullPath)) {
        return null;
      }
      if (state.fullPath == LoginRoute().location) {
        return isAuthenticated ? HomeRoute().location : null;
      }

      return isAuthenticated ? null : LoginRoute().location;
    },
  );
}
