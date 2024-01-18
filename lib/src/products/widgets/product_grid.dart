import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hop_pos/app/app_colors.dart';
import 'package:hop_pos/app/app_styles.dart';
import 'package:hop_pos/src/products/models/product.dart';

class ProductGrid extends HookWidget {
  const ProductGrid({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    final isHover = useState(false);

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
          color: isHover.value ? AppColors.brand600 : AppColors.white,
          child: Center(
            child: Text(
              product.name,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              maxLines: 5,
              style: AppStyles.body.copyWith(
                color: isHover.value ? AppColors.white : AppColors.gray800,
                fontWeight: FontWeight.bold,
                height: 1.15,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
