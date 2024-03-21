import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hop_pos/src/common/controllers/upgrader_controller.dart';
import 'package:updat/updat.dart';

class AutoUpgrader extends ConsumerWidget {
  const AutoUpgrader({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentVersion = ref.read(upgraderControllerProvider.notifier).getCurrentVersion();

    return FutureBuilder<String>(
      future: currentVersion,
      builder: (_, snapshot) {
        return snapshot.data == null
            ? Container()
            : UpdatWidget(
                getDownloadFileLocation: (_) async {
                  return ref.read(upgraderControllerProvider.notifier).getDownloadFileLocation();
                },
                currentVersion: snapshot.data ?? '',
                closeOnInstall: true,
                getLatestVersion: () async {
                  return ref.read(upgraderControllerProvider.notifier).getLatestVersion();
                },
                getBinaryUrl: (version) async {
                  return ref.read(upgraderControllerProvider.notifier).getBinaryUrl(version);
                },
                appName: "HOP POS",
                getChangelog: (_, __) async {
                  return ref.read(upgraderControllerProvider.notifier).getChangelog();
                },
              );
      },
    );
  }
}
