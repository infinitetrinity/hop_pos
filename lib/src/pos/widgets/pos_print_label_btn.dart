import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hop_pos/app/app_colors.dart';
import 'package:hop_pos/app/app_styles.dart';
import 'package:hop_pos/src/common/services/flash_message.dart';
import 'package:hop_pos/src/common/services/print_service.dart';
import 'package:hop_pos/src/pos/controllers/pos_controller.dart';

class PosPrintLabelBtn extends HookConsumerWidget {
  const PosPrintLabelBtn({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isHover = useState(false);
    final customer = ref.watch(posControllerProvider.select((prov) => prov.customer));
    final registration = ref.watch(posControllerProvider.select((prov) => prov.registration));

    void printLabel() async {
      final printService = await ref.read(printServiceProvider.future);
      final result = await printService.printCustomerRegistrationLabel(customer!, registration);

      if (!result) {
        ref.read(flashMessageProvider).flash(message: 'Error printing label', type: FlashMessageType.error);
        return;
      }
    }

    return customer == null
        ? Container()
        : Padding(
            padding: const EdgeInsets.only(right: 10),
            child: MouseRegion(
              onEnter: (_) => isHover.value = true,
              onExit: (_) => isHover.value = false,
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: isHover.value ? AppColors.brand600 : AppColors.white,
                  foregroundColor: isHover.value ? AppColors.white : AppColors.gray700,
                  padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 12),
                ),
                onPressed: printLabel,
                child: Row(
                  children: [
                    Icon(
                      Icons.print,
                      size: 18,
                      color: isHover.value ? AppColors.white : AppColors.gray700,
                    ),
                    const SizedBox(width: 3),
                    Text(
                      'Label',
                      style: AppStyles.body.copyWith(
                        color: isHover.value ? AppColors.white : AppColors.gray700,
                        letterSpacing: 0,
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
  }
}
