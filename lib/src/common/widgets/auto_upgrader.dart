import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hop_pos/src/common/controllers/upgrader_controller.dart';
import 'package:updat/updat.dart';

class AutoUpgrader extends ConsumerWidget {
  const AutoUpgrader({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentVersion = ref.watch(upgraderControllerProvider.notifier).getCurrentVersion();

    return FutureBuilder<String>(
      future: currentVersion,
      builder: (_, snapshot) {
        return snapshot.data == null
            ? Container()
            : UpdatWidget(
                currentVersion: snapshot.data ?? '',
                getLatestVersion: () async {
                  ref.watch(upgraderControllerProvider.notifier).getLatestVersion();
                  return null;
                },
                getBinaryUrl: (_) async {
                  return ref.watch(upgraderControllerProvider.notifier).getBinaryUrl();
                },
                appName: "HOP POS",
                getChangelog: (_, __) async {
                  return ref.watch(upgraderControllerProvider.notifier).getChangelog();
                },
              );
      },
    );
  }
}
