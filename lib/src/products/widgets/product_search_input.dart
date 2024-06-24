import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hop_pos/app/app_colors.dart';
import 'package:hop_pos/app/app_styles.dart';
import 'package:hop_pos/src/common/widgets/form_search_input.dart';
import 'package:hop_pos/src/common/widgets/search_list.dart';
import 'package:hop_pos/src/pos/controllers/pos_controller.dart';
import 'package:hop_pos/src/product_categories/controllers/product_category_controller.dart';
import 'package:hop_pos/src/product_categories/states/to_reorder_product_category_state.dart';
import 'package:hop_pos/src/products/models/product_with_category.dart';
import 'package:hop_pos/src/products/states/products_search_state.dart';
import 'package:hop_pos/src/products/widgets/product_tile.dart';

class ProductSearchInput extends HookConsumerWidget {
  const ProductSearchInput({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isSorting = ref.watch(toReorderProductCategoryStateProvider);
    final textController = TextEditingController();

    return TypeAheadField<ProductWithCategory>(
      suggestionsCallback: (search) => ref.read(productsSearchStateProvider(search).future),
      controller: textController,
      builder: (context, controller, focusNode) => Row(
        children: [
          Expanded(
            child: FormSearchTextInput(
              controller: controller,
              focusNode: focusNode,
              label: 'Search product or category',
            ),
          ),
          TextButton(
            style: TextButton.styleFrom(
              backgroundColor: AppColors.brand600,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(3),
                  bottomRight: Radius.circular(3),
                ),
              ),
              padding: const EdgeInsets.symmetric(vertical: 23, horizontal: 8),
            ),
            onPressed: () => ref.read(toReorderProductCategoryStateProvider.notifier).toggle(),
            child: Text(
              isSorting ? 'Done sorting' : 'Sort Categories',
              style: AppStyles.bodySmall.copyWith(
                color: AppColors.white,
                letterSpacing: 0,
              ),
            ),
          ),
        ],
      ),
      listBuilder: (context, children) => SearchList(children),
      itemBuilder: (context, product) => ProductTile(product),
      emptyBuilder: (context) => Container(
        padding: const EdgeInsets.all(12),
        color: AppColors.white,
        width: double.infinity,
        child: Text(
          'No product or category found',
          style: AppStyles.body,
        ),
      ),
      onSelected: (item) async {
        textController.clear();
        if (item.product != null) {
          await ref.read(posControllerProvider.notifier).addProduct(item.product);
        } else if (item.category != null) {
          ref.read(productCategoryControllerProvider().notifier).selectProductCategory(item.category!);
        }
      },
    );
  }
}
