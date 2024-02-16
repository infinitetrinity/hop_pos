import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hop_pos/app/app_colors.dart';
import 'package:hop_pos/app/app_styles.dart';
import 'package:hop_pos/src/pos/controllers/pos_controller.dart';

class PosSTF extends HookConsumerWidget {
  const PosSTF({
    super.key,
    this.canRemove = true,
    this.padding = const EdgeInsets.only(bottom: 8),
  });
  final bool canRemove;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isHover = useState(false);
    final isStf = ref.watch(posControllerProvider.select((prov) => prov.order?.order.isStf ?? false));

    return isStf
        ? Padding(
            padding: padding,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  color: AppColors.yellow800,
                  padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  child: Text(
                    'Stool to follow',
                    style: AppStyles.bodySmall.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                ),
                if (canRemove)
                  MouseRegion(
                    onEnter: (_) => isHover.value = true,
                    onExit: (_) => isHover.value = false,
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      onTap: () => ref.read(posControllerProvider.notifier).setSTF(isStf: false),
                      child: Text(
                        'remove',
                        style: AppStyles.bodySmall.copyWith(
                          color: AppColors.red600,
                          decorationColor: AppColors.red600,
                          decoration: isHover.value ? TextDecoration.underline : null,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          )
        : Container();
  }
}
