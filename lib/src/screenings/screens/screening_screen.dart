import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hop_pos/src/common/widgets/layout.dart';
import 'package:hop_pos/src/common/widgets/server_connection_status.dart';
import 'package:hop_pos/src/screenings/widgets/screening_search_input.dart';
import 'package:hop_pos/src/screenings/widgets/screenings_list.dart';
import 'package:hop_pos/src/screenings/widgets/selected_screening.dart';

class ScreeningScreen extends ConsumerWidget {
  const ScreeningScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Layout(
      Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            flex: 4,
            child: Column(
              children: [
                ScreeningSearchInput(),
                SizedBox(height: 30),
                ScreeningsList(),
              ],
            ),
          ),
          SizedBox(width: 30),
          Flexible(
            fit: FlexFit.loose,
            flex: 2,
            child: Column(
              children: [
                SelectedScreening(),
                SizedBox(height: 20),
                ServerConnectionStatus(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}