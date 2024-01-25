import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hop_pos/app/app_colors.dart';
import 'package:hop_pos/app/app_styles.dart';
import 'package:hop_pos/src/common/services/overlay_portal_hook.dart';
import 'package:hop_pos/src/pos/widgets/pos_customer_controls.dart';

class PosCustomer extends HookConsumerWidget {
  const PosCustomer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isHover = useState(false);
    const customer = null;
    final controller = useOverlayPortalController();
    final link = LayerLink();
    final width = useState<double?>(null);

    return CompositedTransformTarget(
      link: link,
      child: OverlayPortal(
        controller: controller,
        overlayChildBuilder: (BuildContext context) => CompositedTransformFollower(
          link: link,
          targetAnchor: Alignment.bottomLeft,
          child: PosCustomerControls(
            width: width.value,
          ),
        ),
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          onEnter: (_) => isHover.value = true,
          onExit: (_) => isHover.value = false,
          child: GestureDetector(
            onTap: () {
              width.value = context.size?.width;
              controller.toggle();
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
              decoration: BoxDecoration(
                color: isHover.value ? AppColors.brand600 : AppColors.white,
                border: const Border(
                  top: BorderSide(color: AppColors.gray300),
                ),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.account_circle_rounded,
                    color: isHover.value ? AppColors.white : AppColors.gray800,
                    size: 28,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: customer == null
                          ? [
                              Text(
                                'Select Customer',
                                style: AppStyles.bodyLarge.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: isHover.value ? AppColors.white : AppColors.gray800,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                'Click here to select customer',
                                style: AppStyles.bodySmall.copyWith(
                                  color: isHover.value ? AppColors.white : AppColors.gray600,
                                ),
                              ),
                            ]
                          : [],
                    ),
                  ),
                  Icon(
                    Icons.warning_rounded,
                    color: isHover.value ? AppColors.white : AppColors.yellow500,
                    size: 30,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
