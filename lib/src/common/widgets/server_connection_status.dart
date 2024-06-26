import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hop_pos/app/app_colors.dart';
import 'package:hop_pos/app/app_styles.dart';
import 'package:hop_pos/src/common/states/server_connection_state.dart';
import 'package:hop_pos/src/users/states/auth_state.dart';

class ServerConnectionStatus extends ConsumerWidget {
  const ServerConnectionStatus({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final severState = ref.watch(severConnectionStateProvider);
    final authState = ref.watch(authStateProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              width: 6,
              height: 6,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: severState.maybeWhen(
                  data: (status) => status ? AppColors.green600 : AppColors.red600,
                  orElse: () => AppColors.yellow600,
                ),
              ),
            ),
            const SizedBox(width: 5),
            Text(
              severState.when(
                data: (status) => status ? 'Connected to server' : 'Not connected to server',
                loading: () => 'Connecting to sever',
                error: (e, st) => '',
              ),
              style: AppStyles.bodySmall.copyWith(
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
        authState.when(
          data: (auth) => auth?.displayLastSyncedAt == null
              ? Container()
              : Text(
                  auth!.displayLastSyncedAt!,
                  style: AppStyles.bodySmall,
                ),
          loading: () => Container(),
          error: (e, st) => Container(),
        ),
      ],
    );
  }
}
