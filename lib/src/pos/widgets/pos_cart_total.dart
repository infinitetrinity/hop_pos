import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hop_pos/app/app_colors.dart';
import 'package:hop_pos/src/pos/widgets/pos_extras.dart';
import 'package:hop_pos/src/pos/widgets/pos_subtotal.dart';

class PosCartTotal extends ConsumerWidget {
  const PosCartTotal({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.white,
        border: Border(
          top: BorderSide(color: AppColors.gray300),
          bottom: BorderSide(color: AppColors.gray300),
        ),
      ),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: const Column(
        children: [
          PosSubtotal(),
          SizedBox(height: 8),
          PosExtras(),
        ],
      ),
    );
  }
}
