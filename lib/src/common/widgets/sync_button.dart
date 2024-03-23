import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hop_pos/app/app_colors.dart';
import 'package:hop_pos/app/app_styles.dart';
import 'package:hop_pos/src/common/services/flash_message.dart';
import 'package:hop_pos/src/common/states/server_connection_state.dart';
import 'package:hop_pos/src/common/states/syncing_server_state.dart';
import 'package:hop_pos/src/pos_licenses/states/pos_license_state.dart';

class SyncButton extends HookConsumerWidget {
  const SyncButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final posLicense = ref.watch(posLicenseStateProvider).asData?.value;
    final isConnecting = ref.watch(severConnectionStateProvider);
    final isSyncing = ref.watch(syncingServerStateProvider);
    final isConnected = ref.watch(severConnectionStateProvider).asData?.value == true;

    Color getBackgroundColor() {
      if (isConnecting.isLoading || isSyncing.isLoading) {
        return AppColors.yellow600;
      }

      return isConnected ? AppColors.green600 : AppColors.red600;
    }

    String getText() {
      if (isConnecting.isLoading) {
        return 'Connecting..';
      }
      if (isSyncing.isLoading) {
        return 'Syncing..';
      }

      return isConnected ? 'Click to sync' : 'Click to connect';
    }

    onPressed() async {
      if (isConnecting.isLoading || isSyncing.isLoading) {
        return;
      }

      if (isConnected) {
        final result = await ref.read(syncingServerStateProvider.notifier).syncingServer();
        ref.read(flashMessageProvider).flash(
              message:
                  result ? 'Succesfully synced to server.' : 'Error syncing to the server, please try again later.',
              type: result ? FlashMessageType.success : FlashMessageType.error,
            );
        return;
      }

      final reconnect = await ref.read(severConnectionStateProvider.notifier).checkServerConnection();
      if (!reconnect) {
        ref.read(flashMessageProvider).flash(
              message: 'Error connecting to the server, please try again later.',
              type: FlashMessageType.error,
            );
      }
    }

    return Container(
      color: getBackgroundColor(),
      width: 150,
      height: 66,
      child: TextButton(
        style: ButtonStyle(
          overlayColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
            return Colors.transparent;
          }),
        ),
        onPressed: onPressed,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (posLicense != null)
              Text(
                posLicense.name,
                overflow: TextOverflow.ellipsis,
                style: AppStyles.body.copyWith(
                  color: AppColors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                  letterSpacing: 1,
                ),
              ),
            Text(
              getText(),
              style: AppStyles.body.copyWith(
                color: AppColors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
