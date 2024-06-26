import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hop_pos/app/app_colors.dart';
import 'package:hop_pos/app/app_styles.dart';
import 'package:hop_pos/src/product_categories/controllers/product_category_controller.dart';
import 'package:hop_pos/src/product_categories/states/selected_product_category_state.dart';

class ProductCategoriesTabNav extends HookConsumerWidget {
  const ProductCategoriesTabNav({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categories = ref.watch(productCategoryControllerProvider());
    final selectedCategory = ref.watch(selectedProductCategoryStateProvider);

    return categories.when(
      data: (categories) {
        final controller = useTabController(initialLength: categories.length);

        ref.listen(selectedProductCategoryStateProvider, (_, category) {
          final index = category != null ? categories.indexOf(category) : -1;

          if (index >= 0 && controller.index != index) {
            controller.animateTo(index);
          }
        });

        return Container(
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(color: AppColors.gray300),
            ),
          ),
          child: DefaultTabController(
            initialIndex: selectedCategory == null
                ? categories.indexOf(categories.firstWhere((category) => category.id == 0))
                : categories.indexOf(selectedCategory),
            length: categories.length,
            child: TabBar(
              controller: controller,
              onTap: (index) {
                ref.read(productCategoryControllerProvider().notifier).selectProductCategory(categories[index]);
              },
              isScrollable: true,
              tabAlignment: TabAlignment.start,
              indicatorColor: AppColors.brand600,
              labelStyle: AppStyles.bodyLarge.copyWith(
                color: AppColors.gray800,
                fontWeight: FontWeight.w600,
              ),
              unselectedLabelStyle: AppStyles.bodyLarge.copyWith(
                color: AppColors.gray600,
              ),
              tabs: categories
                  .map(
                    (category) => Tab(
                      text: category.name,
                    ),
                  )
                  .toList(),
            ),
          ),
        );
      },
      error: (err, stack) => Container(),
      loading: () => Container(),
    );
  }
}
