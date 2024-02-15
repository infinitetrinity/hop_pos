import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hop_pos/app/app_colors.dart';
import 'package:hop_pos/app/app_styles.dart';
import 'package:hop_pos/src/common/services/flash_message.dart';
import 'package:hop_pos/src/pos/controllers/pos_controller.dart';

class PosParkSalesBtn extends HookConsumerWidget {
  const PosParkSalesBtn({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isHover = useState(false);
    final canCheckout =
        ref.watch(posControllerProvider.select((prov) => prov.order != null && (prov.order?.items?.length ?? 0) > 0));

    void parkSales() async {
      isHover.value = false;
      await ref.read(posControllerProvider.notifier).checkout();
      ref.read(posControllerProvider.notifier).reset();
      ref.read(flashMessageProvider).flash(message: 'Successfully parked sales.');
    }

    return canCheckout
        ? Padding(
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
                onPressed: parkSales,
                child: Row(
                  children: [
                    Icon(
                      Icons.local_parking,
                      size: 18,
                      color: isHover.value ? AppColors.white : AppColors.gray700,
                    ),
                    const SizedBox(width: 3),
                    Text(
                      'Park',
                      style: AppStyles.body.copyWith(
                        color: isHover.value ? AppColors.white : AppColors.gray700,
                        letterSpacing: 0,
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        : Container();
  }
}
