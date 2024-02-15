import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hop_pos/src/product_categories/states/to_reorder_product_category_state.dart';
import 'package:hop_pos/src/product_categories/widgets/product_categories_sort_controls.dart';
import 'package:hop_pos/src/product_categories/widgets/product_categories_sort_list.dart';
import 'package:hop_pos/src/product_categories/widgets/product_categories_tab_nav.dart';
import 'package:hop_pos/src/products/controllers/products_controller.dart';
import 'package:hop_pos/src/products/widgets/product_grid.dart';

class ProductsList extends ConsumerWidget {
  const ProductsList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isSorting = ref.watch(toReorderProductCategoryStateProvider);
    final productsAsync = ref.watch(productsControllerProvider);

    return Column(
      children: [
        isSorting
            ? const Column(
                children: [
                  ProductCategoriesSortControls(),
                  ProductCategoriesSortList(),
                ],
              )
            : Column(
                children: [
                  const ProductCategoriesTabNav(),
                  const SizedBox(height: 20),
                  productsAsync.when(
                    data: (products) => Container(
                      height: 625,
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: GridView.builder(
                        shrinkWrap: true,
                        physics: const AlwaysScrollableScrollPhysics(),
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                          childAspectRatio: 1.25,
                        ),
                        itemCount: products.length,
                        itemBuilder: (context, index) => ProductGrid(product: products[index]),
                      ),
                    ),
                    error: (err, stack) => Container(),
                    loading: () => Container(),
                  ),
                ],
              ),
      ],
    );
  }
}
