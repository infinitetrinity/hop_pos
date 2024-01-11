import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hop_pos/app/app_colors.dart';
import 'package:hop_pos/src/common/widgets/layout.dart';
import 'package:hop_pos/src/screenings/widgets/screening_search_input.dart';
import 'package:hop_pos/src/screenings/widgets/screenings_list.dart';

class ScreeningScreen extends ConsumerWidget {
  const ScreeningScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Layout(
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Flexible(
            flex: 3,
            child: Column(
              children: [
                ScreeningSearchInput(),
                SizedBox(height: 30),
                ScreeningsList(),
              ],
            ),
          ),
          const SizedBox(width: 40),
          Flexible(
            flex: 2,
            child: Column(
              children: [
                Container(
                  color: AppColors.white,
                  width: double.infinity,
                  height: 400,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
