import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hop_pos/app/app_colors.dart';
import 'package:hop_pos/app/app_extension.dart';
import 'package:hop_pos/routes/screening_routes.dart';
import 'package:hop_pos/src/common/services/flash_message.dart';
import 'package:hop_pos/src/login/controllers/login_controller.dart';
import 'package:hop_pos/src/login/models/login_request.dart';
import 'package:hop_pos/src/login/models/syncing_progress.dart';
import 'package:hop_pos/src/login/state/syncing_state.dart';
import 'package:hop_pos/src/login/widgets/login_background.dart';
import 'package:hop_pos/src/login/widgets/login_form.dart';
import 'package:hop_pos/src/login/widgets/syncing_content.dart';

class LoginScreen extends HookConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    SyncingProgress syncingState = ref.watch(syncingStateProvider);

    Future<void> onSubmit(LoginRequest request) async {
      final result = await ref.read(loginControllerProvider.notifier).login(request);

      if (context.mounted && result == true) {
        ref.read(flashMessageProvider).flash(message: 'Initial sync completed.');
        ScreeningRoute().go(context);
      }
    }

    ref.listen(loginControllerProvider, (_, state) {
      if (context.mounted) {
        state.flashError(ref.read(flashMessageProvider));
      }
    });

    return Scaffold(
      body: Container(
        color: AppColors.white,
        child: Row(
          children: [
            const LoginBackground(),
            syncingState.isSyncing
                ? const SyncingContent()
                : LoginForm(
                    onSubmit: onSubmit,
                  ),
          ],
        ),
      ),
    );
  }
}
