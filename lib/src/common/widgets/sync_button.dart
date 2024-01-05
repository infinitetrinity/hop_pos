import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hop_pos/app/app_colors.dart';
import 'package:hop_pos/app/app_styles.dart';
import 'package:hop_pos/src/common/services/flash_message.dart';
import 'package:hop_pos/src/common/states/server_connection_state.dart';

class SyncButton extends HookConsumerWidget {
  const SyncButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isConnecting = useState(false);
    final severState = ref.watch(severConnectionStateProvider);

    Color getBackgroundColor() {
      return severState.maybeWhen(
        data: (status) => status ? AppColors.green600 : AppColors.red600,
        orElse: () => isConnecting.value ? AppColors.yellow600 : AppColors.green600,
      );
    }

    onPressed() async {
      if (isConnecting.value) {
        return;
      }

      final isConnected = await ref.read(severConnectionStateProvider.future);

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
        child: severState.when(
          data: (status) => Text(
            status ? 'Click to sync' : 'Click to connect',
            style: AppStyles.body.copyWith(
              color: AppColors.white,
            ),
          ),
          error: (e, s) => const SizedBox(),
          loading: () => Text(
            isConnecting.value ? 'Connecting..' : 'Click to sync',
            style: AppStyles.body.copyWith(
              color: AppColors.white,
            ),
          ),
        ),
      ),
    );
  }
}
