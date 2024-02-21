import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hop_pos/app/app_colors.dart';
import 'package:hop_pos/app/app_styles.dart';
import 'package:hop_pos/src/common/services/flash_message.dart';
import 'package:hop_pos/src/common/services/print_service.dart';

class PosCompletedPrintUtfStfBtn extends HookConsumerWidget {
  const PosCompletedPrintUtfStfBtn({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isHover = useState(false);

    void printReceipt() async {
      final printed = await ref.read(printServiceProvider).printUtfStfReceipt();
      if (!printed) {
        ref.read(flashMessageProvider).flash(
              message: 'Unable to print receipt, please check your printer setting and try again',
              type: FlashMessageType.error,
            );
      }
    }

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => isHover.value = true,
      onExit: (_) => isHover.value = false,
      child: SizedBox(
        width: 200,
        child: TextButton(
          style: TextButton.styleFrom(
            backgroundColor: isHover.value ? AppColors.blue600 : Colors.transparent,
            shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          ),
          onPressed: printReceipt,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.print_outlined,
                size: 25,
                color: isHover.value ? AppColors.white : AppColors.blue600,
              ),
              const SizedBox(width: 10),
              Text(
                'Print UTF/STF',
                style: AppStyles.body.copyWith(
                  fontSize: 18,
                  color: isHover.value ? AppColors.white : AppColors.blue600,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
