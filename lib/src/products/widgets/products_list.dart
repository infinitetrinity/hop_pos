import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hop_pos/src/common/services/carousel_hook.dart';
import 'package:hop_pos/src/common/widgets/grids_carousel.dart';
import 'package:hop_pos/src/product_categories/states/to_reorder_product_category_state.dart';
import 'package:hop_pos/src/product_categories/widgets/product_categories_sort_controls.dart';
import 'package:hop_pos/src/product_categories/widgets/product_categories_sort_list.dart';
import 'package:hop_pos/src/product_categories/widgets/product_categories_tab_nav.dart';
import 'package:hop_pos/src/products/controllers/products_controller.dart';
import 'package:hop_pos/src/products/widgets/product_grid.dart';

class ProductsList extends HookConsumerWidget {
  const ProductsList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = useCarouselController();
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
                    data: (products) => GridsCarousel(
                      controller: controller,
                      items: products,
                      itemBuilder: (item) => ProductGrid(product: item),
                      height: 625,
                      aspectRatio: 1.25,
                      arrows: false,
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
