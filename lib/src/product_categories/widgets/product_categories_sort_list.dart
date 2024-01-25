import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hop_pos/app/app_colors.dart';
import 'package:hop_pos/app/app_styles.dart';
import 'package:hop_pos/src/product_categories/controllers/product_category_controller.dart';

class ProductCategoriesSortList extends HookConsumerWidget {
  const ProductCategoriesSortList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categories = ref.watch(productCategoryControllerProvider(showHidden: true));

    return categories.when(
      data: (categories) {
        return Material(
          child: SizedBox(
            height: 650,
            child: ReorderableListView(
              onReorder: (int oldIndex, int newIndex) async {
                await ref.read(productCategoryControllerProvider().notifier).reorderProductCategories(oldIndex, newIndex);
                ref.invalidate(productCategoryControllerProvider);
              },
              children: List.generate(
                categories.length,
                (index) => ListTile(
                  key: Key('categories-sort-$index'),
                  tileColor: index % 2 == 0 ? AppColors.gray50 : AppColors.gray100,
                  contentPadding: const EdgeInsets.only(right: 35, left: 15),
                  selected: false,
                  shape: const Border(
                    bottom: BorderSide(color: AppColors.gray300, width: 1),
                  ),
                  title: Text(
                    categories[index].name,
                    style: AppStyles.body,
                  ),
                  trailing: categories[index].id == 0
                      ? null
                      : TextButton(
                          onPressed: () async {
                            await ref.read(productCategoryControllerProvider().notifier).toggleProductCategory(categories[index]);
                            ref.invalidate(productCategoryControllerProvider);
                          },
                          child: Text(
                            categories[index].isHidden ? 'Unhide' : 'Hide',
                            style: AppStyles.bodySmall.copyWith(color: categories[index].isHidden ? AppColors.green600 : AppColors.blue600),
                          ),
                        ),
                ),
              ),
            ),
          ),
        );
      },
      error: (err, stack) {
        print('err $stack');
        return Container(child: const Text('error'));
      },
      loading: () => Container(
        child: const Text('loading'),
      ),
    );
  }
}
