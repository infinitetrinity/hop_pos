import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hop_pos/app/app_colors.dart';
import 'package:hop_pos/app/app_styles.dart';
import 'package:hop_pos/src/product_categories/controllers/product_category_controller.dart';

class ProductCategoriesTabNav extends HookConsumerWidget {
  const ProductCategoriesTabNav({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categories = ref.watch(productCategoryControllerProvider);

    return categories.when(
      data: (categories) {
        final controller = useTabController(initialLength: categories.length);

        return Container(
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(color: AppColors.gray300),
            ),
          ),
          child: TabBar(
            isScrollable: true,
            tabAlignment: TabAlignment.start,
            controller: controller,
            indicatorColor: AppColors.brand600,
            labelColor: AppColors.gray900,
            unselectedLabelColor: AppColors.gray600,
            labelStyle: AppStyles.body.copyWith(fontWeight: FontWeight.bold),
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
