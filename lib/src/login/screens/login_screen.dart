import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hop_pos/app/app_colors.dart';
import 'package:hop_pos/src/login/state/syncing_state.dart';
import 'package:hop_pos/src/login/widgets/login_background.dart';
import 'package:hop_pos/src/login/widgets/login_form.dart';
import 'package:hop_pos/src/login/widgets/syncing_content.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isSyncing = ref.watch(syncingStateProvider);

    return Scaffold(
      body: Container(
        color: AppColors.white,
        child: Row(
          children: [
            const LoginBackground(),
            isSyncing ? const SyncingContent() : const LoginForm(),
          ],
        ),
      ),
    );
  }
}
