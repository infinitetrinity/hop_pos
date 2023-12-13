import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hop_pos/app/app_colors.dart';
import 'package:hop_pos/app/app_routes.dart';
import 'package:window_manager/window_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await windowManager.ensureInitialized();
  WindowOptions windowOptions = const WindowOptions(
    minimumSize: Size(1280, 1024),
    center: true,
  );
  windowManager.waitUntilReadyToShow(windowOptions, () async {
    await windowManager.show();
    await windowManager.focus();
    await windowManager.maximize();
    await windowManager.setResizable(false);
  });

  GoogleFonts.config.allowRuntimeFetching = false;
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final goRouter = ref.watch(goRouterProvider);

    return MaterialApp.router(
      builder: (context, child) {
        return Overlay(
          initialEntries: [
            if (child != null) ...[
              OverlayEntry(
                builder: (context) => child,
              ),
            ],
          ],
        );
      },
      title: 'HOP POS',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.brand700),
        useMaterial3: true,
      ),
      routerConfig: goRouter,
      debugShowCheckedModeBanner: false,
    );
  }
}
