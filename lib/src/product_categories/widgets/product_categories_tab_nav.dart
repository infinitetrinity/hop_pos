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
    late TabController controller;
    final categories = ref.watch(productCategoryControllerProvider());
    final selectedCategory = ref.watch(selectedProductCategoryStateProvider);

    return categories.when(
      data: (categories) {
        controller = useTabController(
          initialLength: categories.length,
          initialIndex:
              selectedCategory == null ? categories.indexOf(categories.firstWhere((category) => category.id == 0)) : categories.indexOf(selectedCategory),
        );

        return Container(
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(color: AppColors.gray300),
            ),
          ),
          child: TabBar(
            onTap: (index) => ref.read(productCategoryControllerProvider().notifier).selectProductCategory(categories[index]),
            isScrollable: true,
            tabAlignment: TabAlignment.start,
            controller: controller,
            indicatorColor: AppColors.brand600,
            labelColor: AppColors.gray900,
            unselectedLabelColor: AppColors.gray600,
            labelStyle: AppStyles.body.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
            tabs: categories
                .map(
                  (category) => Tab(
                    text: category.name,
                  ),
                )
                .toList(),
          ),
        );
      },
      error: (err, stack) {
        return Container(child: const Text('error'));
      },
      loading: () => Container(
        child: const Text('loading'),
      ),
    );
  }
}
