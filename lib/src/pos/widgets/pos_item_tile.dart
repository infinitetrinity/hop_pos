import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hop_pos/app/app_colors.dart';
import 'package:hop_pos/app/app_styles.dart';
import 'package:hop_pos/src/order_items/models/order_item.dart';
import 'package:hop_pos/src/pos/controllers/pos_controller.dart';

class PosItemTile extends HookConsumerWidget {
  const PosItemTile({super.key, required this.item, required this.index});
  final OrderItem item;
  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final orderIsNew = ref.watch(posControllerProvider.select((value) => value.order?.order.isNew == true));
    final canEdit = useState(item.isNew == true);
    final isEditHover = useState(false);
    final isActionHover = useState(false);

    return Material(
      child: MouseRegion(
        cursor: canEdit.value ? SystemMouseCursors.click : SystemMouseCursors.forbidden,
        onEnter: (_) => isEditHover.value = true,
        onExit: (_) => isEditHover.value = false,
        child: GestureDetector(
          onTap: canEdit.value
              ? () {
                  print('edit item $index');
                }
              : null,
          child: Container(
            decoration: BoxDecoration(
              color: canEdit.value
                  ? (isActionHover.value
                      ? AppColors.red600
                      : isEditHover.value
                          ? AppColors.blue100
                          : AppColors.white)
                  : (isActionHover.value ? AppColors.yellow400 : AppColors.gray100),
              border: index == 1
                  ? null
                  : const Border(
                      top: BorderSide(color: AppColors.gray300),
                    ),
            ),
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(width: 12),
                Text(
                  "$index)",
                  style: AppStyles.bodyLarge.copyWith(
                    fontWeight: FontWeight.bold,
                    color: canEdit.value && isActionHover.value ? AppColors.white : AppColors.gray800,
                  ),
                ),
                const SizedBox(width: 5),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${item.name} (${item.sku})",
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                        style: AppStyles.bodyLarge.copyWith(
                          fontWeight: FontWeight.bold,
                          height: 1.3,
                          color: canEdit.value && isActionHover.value ? AppColors.white : AppColors.gray800,
                        ),
                      ),
                      if (!orderIsNew && item.isNew == true)
                        Text(
                          'New Product',
                          style: AppStyles.bodySmall.copyWith(
                            color: canEdit.value && isActionHover.value ? AppColors.white : AppColors.brand800,
                          ),
                        ),
                    ],
                  ),
                ),
                const SizedBox(width: 5),
                Column(
                  children: [
                    Text(
                      item.displayNetPrice,
                      style: AppStyles.bodyLarge.copyWith(
                        fontWeight: FontWeight.bold,
                        color: canEdit.value && isActionHover.value ? AppColors.white : AppColors.gray800,
                      ),
                    ),
                    if (item.hasDiscount) ...[
                      const SizedBox(height: 2),
                      Text(
                        item.displayPrice,
                        style: AppStyles.bodySmall.copyWith(
                          decoration: TextDecoration.lineThrough,
                          color: canEdit.value && isActionHover.value ? AppColors.white : AppColors.gray800,
                        ),
                      ),
                    ],
                  ],
                ),
                const SizedBox(width: 5),
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  onEnter: (_) => isActionHover.value = true,
                  onExit: (_) => isActionHover.value = false,
                  child: Container(
                    padding: const EdgeInsets.only(top: 10, bottom: 10, right: 12),
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onPressed: () {
                        if (canEdit.value) {
                          print('delete item $index');
                          return;
                        }
                        canEdit.value = true;
                      },
                      icon: Icon(
                        canEdit.value ? Icons.delete_outline : Icons.lock_outline,
                        color: canEdit.value && isActionHover.value ? AppColors.white : AppColors.gray400,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
