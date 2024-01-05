import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hop_pos/src/common/widgets/layout.dart';
import 'package:hop_pos/src/common/widgets/server_connection_status.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Layout(
      Column(
        children: [
          Text('Home Screen'),
          ServerConnectionStatus(),
        ],
      ),
    );
  }
}
