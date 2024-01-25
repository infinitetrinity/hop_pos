import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hop_pos/app/app_colors.dart';
import 'package:hop_pos/app/app_extension.dart';
import 'package:hop_pos/app/app_styles.dart';
import 'package:hop_pos/src/products/models/product_with_category.dart';

class ProductTile extends HookWidget {
  const ProductTile(this.item, {super.key});
  final ProductWithCategory item;

  @override
  Widget build(BuildContext context) {
    final isHover = useState(false);

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => isHover.value = true,
      onExit: (_) => isHover.value = false,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
        color: isHover.value ? AppColors.brand600 : AppColors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${item.product.name} (${item.product.sku})",
              overflow: TextOverflow.ellipsis,
              style: AppStyles.bodyLarge.copyWith(
                fontWeight: FontWeight.w600,
                color: isHover.value ? AppColors.white : AppColors.gray800,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              "${item.product.price.formatMoney} ${item.category == null ? '' : ' | ${item.category!.name}'}",
              style: AppStyles.bodySmall.copyWith(
                color: isHover.value ? AppColors.white : AppColors.gray800,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
