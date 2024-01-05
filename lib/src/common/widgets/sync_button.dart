import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hop_pos/app/app_colors.dart';
import 'package:hop_pos/app/app_styles.dart';
import 'package:hop_pos/src/common/services/flash_message.dart';
import 'package:hop_pos/src/common/states/server_connection_state.dart';
import 'package:hop_pos/src/pos_licenses/states/pos_license_state.dart';

class SyncButton extends HookConsumerWidget {
  const SyncButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isConnecting = useState(false);
    final isConnected = ref.watch(severConnectionStateProvider).asData?.value;
    final posLicense = ref.watch(posLicenseStateProvider).asData?.value;

    Color getBackgroundColor() {
      if (isConnecting.value || isConnected == null) {
        return AppColors.yellow600;
      }

      return isConnected == true ? AppColors.green600 : AppColors.red600;
    }

    onPressed() async {
      if (isConnecting.value || isConnected == null) {
        return;
      }

      if (isConnected) {
        print('to sync');
        return;
      }

      isConnecting.value = true;
      final reconnect = await ref.read(severConnectionStateProvider.notifier).checkServerConnection();
      isConnecting.value = false;
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
                ),
              ),
            Text(
              isConnected == true ? 'Click to sync' : (isConnecting.value ? 'Connecting...' : 'Click to connect'),
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
