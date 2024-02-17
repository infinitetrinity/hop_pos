import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hop_pos/routes/login_routes.dart';
import 'package:hop_pos/src/common/services/setup_service.dart';
import 'package:hop_pos/src/common/widgets/logo_loading.dart';

class SetupScreen extends HookConsumerWidget {
  const SetupScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        ref.watch(setupServiceProvider.notifier);
        if (context.mounted) {
          LoginRoute().go(context);
        }
      });

      return;
    }, null);

    return const LogoLoading();
  }
}
