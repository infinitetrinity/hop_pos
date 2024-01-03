import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hop_pos/app/app_colors.dart';
import 'package:hop_pos/src/common/models/validation_errors.dart';
import 'package:hop_pos/src/login/controllers/login_controller.dart';
import 'package:hop_pos/src/login/models/login_request.dart';
import 'package:hop_pos/src/login/state/syncing_state.dart';
import 'package:hop_pos/src/login/widgets/login_background.dart';
import 'package:hop_pos/src/login/widgets/login_form.dart';
import 'package:hop_pos/src/login/widgets/syncing_content.dart';

class LoginScreen extends HookConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isSyncing = ref.watch(syncingStateProvider);

    Future<ValidationErrors?> onSubmit(LoginRequest request) async {
      final result = await ref.read(loginControllerProvider.notifier).login(request);
      if (context.mounted && result == true) {
        //context.go(HomeRoute().location);
      } else if (result is ValidationErrors) {
        return result;
      }

      return null;
    }

    return Scaffold(
      body: Container(
        color: AppColors.white,
        child: Row(
          children: [
            const LoginBackground(),
            isSyncing
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
