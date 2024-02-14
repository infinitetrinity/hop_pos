import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hop_pos/app/app_colors.dart';
import 'package:hop_pos/app/app_extension.dart';
import 'package:hop_pos/app/app_styles.dart';
import 'package:hop_pos/src/common/services/flash_message.dart';
import 'package:hop_pos/src/order_items/widgets/custom_order_item_dialog.dart';
import 'package:hop_pos/src/pos/controllers/pos_controller.dart';
import 'package:hop_pos/src/products/models/product.dart';

class ProductGrid extends HookConsumerWidget {
  const ProductGrid({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isHover = useState(false);
    final color = product.colorCode.parseColor;
    final customer = ref.watch(posControllerProvider.select((prov) => prov.customer));
    final order = ref.watch(posControllerProvider.select((prov) => prov.order));

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => isHover.value = true,
      onExit: (_) => isHover.value = false,
      child: GestureDetector(
        onTap: () async {
          if (customer == null) {
            ref
                .read(flashMessageProvider)
                .flash(message: 'Please select a customer first.', type: FlashMessageType.error);
            return;
          }

          if (order == null) {
            ref.read(flashMessageProvider).flash(message: 'Invalid order.', type: FlashMessageType.error);
            return;
          }

          if (product.id == 0) {
            if (product.sku == "Custom" && context.mounted) {
              return showDialog(
                context: context,
                builder: (_) => const CustomOrderItemDialog(),
              );
            }

            if (product.sku == "UTF") {
              return await ref.read(posControllerProvider.notifier).setUTF();
            }

            if (product.sku == "STF") {
              return await ref.read(posControllerProvider.notifier).setSTF();
            }
          }

          await ref.read(posControllerProvider.notifier).addProduct(product);
        },
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: isHover.value ? color : AppColors.white,
            border: Border(
              top: BorderSide(
                width: 6,
                color: color,
              ),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                product.name,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
                style: AppStyles.bodyLarge.copyWith(
                  color: isHover.value ? AppColors.white : AppColors.gray800,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                "(${product.sku})",
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: AppStyles.body.copyWith(
                  color: isHover.value ? AppColors.white : AppColors.gray500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
