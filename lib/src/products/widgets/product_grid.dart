import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hop_pos/app/app_colors.dart';
import 'package:hop_pos/app/app_extension.dart';
import 'package:hop_pos/app/app_styles.dart';
import 'package:hop_pos/src/products/models/product.dart';

class ProductGrid extends HookWidget {
  const ProductGrid({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    final isHover = useState(false);
    final color = product.colorCode.parseColor;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => isHover.value = true,
      onExit: (_) => isHover.value = false,
      child: GestureDetector(
        onTap: () {
          print('selected product');
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
                style: AppStyles.body.copyWith(
                  fontSize: 18,
                  color: isHover.value ? AppColors.white : AppColors.gray800,
                  fontWeight: FontWeight.bold,
                  height: 1.15,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                "(${product.sku})",
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: AppStyles.body.copyWith(
                  fontSize: 13,
                  color: isHover.value ? AppColors.white : AppColors.gray800,
                  fontWeight: FontWeight.bold,
                  height: 1.15,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
