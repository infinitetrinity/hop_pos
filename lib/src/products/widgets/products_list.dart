import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hop_pos/app/app_colors.dart';
import 'package:hop_pos/app/app_styles.dart';
import 'package:hop_pos/src/product_categories/widgets/product_categories_sort_list.dart';
import 'package:hop_pos/src/product_categories/widgets/product_categories_tab_nav.dart';

class ProductsList extends HookConsumerWidget {
  const ProductsList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final toReorder = useState(false);

    return Column(
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: TextButton(
            style: TextButton.styleFrom(
              padding: const EdgeInsets.all(0),
            ),
            onPressed: () => toReorder.value = !toReorder.value,
            child: Text(
              'Reorder Categories',
              textAlign: TextAlign.right,
              style: AppStyles.bodySmall.copyWith(
                color: AppColors.gray600,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ),
        toReorder.value ? const ProductCategoriesSortList() : const ProductCategoriesTabNav(),
      ],
    );
  }
}
