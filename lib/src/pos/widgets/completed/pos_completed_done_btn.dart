import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hop_pos/app/app_colors.dart';
import 'package:hop_pos/app/app_styles.dart';

class PosCompletedDoneBtn extends ConsumerWidget {
  const PosCompletedDoneBtn({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final focusNode = FocusNode();
    FocusScope.of(context).requestFocus(focusNode);

    void onPressed() {
      // ref.read(posControllerProvider.notifier).reset();
      // PosRoute().go(context);
      context.pop();
    }

    return RawKeyboardListener(
      focusNode: focusNode,
      onKey: (RawKeyEvent event) {
        if (event is RawKeyDownEvent && event.logicalKey == LogicalKeyboardKey.escape) {
          onPressed();
        }
      },
      child: SizedBox(
        width: 500,
        child: TextButton(
          style: TextButton.styleFrom(
            backgroundColor: AppColors.green600,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
          ),
          onPressed: onPressed,
          child: Text(
            'Done (ESC)',
            style: AppStyles.bodyLarge.copyWith(
              fontSize: 20,
              color: AppColors.white,
            ),
          ),
        ),
      ),
    );
  }
}
