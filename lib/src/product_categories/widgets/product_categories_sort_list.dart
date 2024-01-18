import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hop_pos/app/app_colors.dart';
import 'package:hop_pos/app/app_styles.dart';
import 'package:hop_pos/src/product_categories/controllers/product_category_controller.dart';

class ProductCategoriesSortList extends HookConsumerWidget {
  const ProductCategoriesSortList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categories = ref.watch(productCategoryControllerProvider);

    return categories.when(
      data: (categories) {
        return Material(
          child: SizedBox(
            height: 500,
            child: ReorderableListView(
              onReorder: (int oldIndex, int newIndex) async {
                await ref.read(productCategoryControllerProvider.notifier).reorderProductCategories(oldIndex, newIndex);
              },
              children: List.generate(
                categories.length,
                (index) => ListTile(
                  key: Key('categories-sort-$index'),
                  tileColor: index % 2 == 0 ? AppColors.gray50 : AppColors.gray100,
                  selected: false,
                  shape: const Border(
                    bottom: BorderSide(color: AppColors.gray300, width: 1),
                  ),
                  title: Text(
                    categories[index].name,
                    style: AppStyles.bodySmall,
                  ),
                ),
              ),
            ),
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
