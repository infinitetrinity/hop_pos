import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hop_pos/app/app_colors.dart';
import 'package:hop_pos/app/app_extension.dart';
import 'package:hop_pos/routes/screening_routes.dart';
import 'package:hop_pos/src/common/services/flash_message.dart';
import 'package:hop_pos/src/common/widgets/auto_upgrader.dart';
import 'package:hop_pos/src/login/controllers/login_controller.dart';
import 'package:hop_pos/src/login/models/login_request.dart';
import 'package:hop_pos/src/login/widgets/login_background.dart';
import 'package:hop_pos/src/login/widgets/reauthenticate_form.dart';

class ReauthenticateScreen extends HookConsumerWidget {
  const ReauthenticateScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Future<void> onSubmit(LoginRequest request) async {
      final result = await ref.read(loginControllerProvider.notifier).reauthenticate(request);

      if (context.mounted && result == true) {
        ref.read(flashMessageProvider).flash(message: 'Reauthenticated successfully.');
        ScreeningRoute().go(context);
      }
    }

    ref.listen(loginControllerProvider, (_, state) {
      if (context.mounted) {
        state.flashError(ref.read(flashMessageProvider));
      }
    });

    return Scaffold(
      floatingActionButton: const AutoUpgrader(),
      body: Container(
        color: AppColors.white,
        child: Row(
          children: [
            const LoginBackground(),
            ReauthenticateForm(onSubmit: onSubmit),
          ],
        ),
      ),
    );
  }
}
