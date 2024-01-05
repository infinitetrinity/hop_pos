import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hop_pos/app/app_colors.dart';
import 'package:hop_pos/app/app_styles.dart';
import 'package:hop_pos/src/common/states/server_connection_state.dart';

class ServerConnectionStatus extends ConsumerWidget {
  const ServerConnectionStatus({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final severState = ref.watch(serverConnectionStateProvider);

    return severState.when(
      data: (status) => Row(
        children: [
          Container(
            width: 6,
            height: 6,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: status ? AppColors.green600 : AppColors.red600,
            ),
          ),
          const SizedBox(width: 5),
          Text(
            status ? 'Connected to server' : 'Not connected to server',
            style: AppStyles.bodySmall.copyWith(fontStyle: FontStyle.italic),
          ),
        ],
      ),
      loading: () => Container(),
      error: (e, st) => Container(),
    );
  }
}
