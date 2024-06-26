import 'package:go_router/go_router.dart';
import 'package:hop_pos/app/app_global.dart';
import 'package:hop_pos/routes/db_routes.dart';
import 'package:hop_pos/routes/login_routes.dart';
import 'package:hop_pos/routes/order_routes.dart';
import 'package:hop_pos/routes/pos_routes.dart';
import 'package:hop_pos/routes/screening_routes.dart';
import 'package:hop_pos/src/pos/controllers/pos_controller.dart';
import 'package:hop_pos/src/users/states/auth_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_routes.g.dart';

@riverpod
GoRouter goRouter(GoRouterRef ref) {
  return GoRouter(
    navigatorKey: navigatorKey,
    routes: [
      $dbScreenRoute,
      $loginRoute,
      $screeningRoute,
      $orderRoute,
      $posRoute,
    ],
    redirect: (context, state) async {
      List<String> ignoreRoutes = [DbScreenRoute().location];
      if (ignoreRoutes.contains(state.fullPath)) {
        return null;
      }

      bool isAuthenticated = await ref.read(authStateProvider.future) != null;
      if (state.fullPath == LoginRoute().location) {
        return isAuthenticated ? ScreeningRoute().location : null;
      }

      if (state.fullPath == ScreeningRoute().location) {
        ref.invalidate(posControllerProvider);
      }

      return isAuthenticated ? null : LoginRoute().location;
    },
  );
}
