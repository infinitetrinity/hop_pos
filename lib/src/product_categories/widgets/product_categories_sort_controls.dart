import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hop_pos/app/app_colors.dart';
import 'package:hop_pos/app/app_styles.dart';
import 'package:hop_pos/src/product_categories/controllers/product_category_controller.dart';

class ProductCategoriesSortControls extends ConsumerWidget {
  const ProductCategoriesSortControls({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categories = ref.watch(productCategoryControllerProvider(showHidden: true));

    return categories.when(
      data: (categories) => Padding(
        padding: const EdgeInsets.only(top: 5, bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: AppColors.blue400,
                padding: const EdgeInsets.all(12),
              ),
              onPressed: () async {
                await ref
                    .read(productCategoryControllerProvider().notifier)
                    .sortProductCategoriesAlphabetically(categories);
                ref.invalidate(productCategoryControllerProvider);
              },
              child: Text(
                'Sort alphabetically',
                textAlign: TextAlign.right,
                style: AppStyles.bodySmall.copyWith(
                  color: AppColors.white,
                ),
              ),
            ),
            const SizedBox(width: 10),
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: AppColors.blue400,
                padding: const EdgeInsets.all(12),
              ),
              onPressed: () async {
                await ref.read(productCategoryControllerProvider().notifier).toggleAllProductCategories(categories);
                ref.invalidate(productCategoryControllerProvider);
              },
              child: Text(
                'Hide/Unhide all',
                textAlign: TextAlign.right,
                style: AppStyles.bodySmall.copyWith(
                  color: AppColors.white,
                ),
              ),
            ),
          ],
        ),
      ),
      error: (err, stack) => Container(),
      loading: () => Container(),
    );
  }
}
