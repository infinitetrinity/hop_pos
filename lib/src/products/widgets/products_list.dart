import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hop_pos/app/app_colors.dart';
import 'package:hop_pos/app/app_styles.dart';
import 'package:hop_pos/src/common/services/carousel_hook.dart';
import 'package:hop_pos/src/common/widgets/grids_carousel.dart';
import 'package:hop_pos/src/product_categories/widgets/product_categories_sort_list.dart';
import 'package:hop_pos/src/product_categories/widgets/product_categories_tab_nav.dart';
import 'package:hop_pos/src/products/controllers/products_controller.dart';
import 'package:hop_pos/src/products/widgets/product_grid.dart';

class ProductsList extends HookConsumerWidget {
  const ProductsList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = useCarouselController();
    final toReorder = useState(false);
    final productsAsync = ref.watch(productsControllerProvider);

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
        toReorder.value
            ? const ProductCategoriesSortList()
            : Column(
                children: [
                  const ProductCategoriesTabNav(),
                  const SizedBox(height: 30),
                  productsAsync.when(
                    data: (products) => GridsCarousel(
                      controller: controller,
                      items: products,
                      itemBuilder: (item) => ProductGrid(product: item),
                      height: 635,
                      aspectRatio: 1.32,
                    ),
                    error: (err, stack) {
                      print(err);
                      return Container(child: const Text('error'));
                    },
                    loading: () => Container(
                      child: const Text('loading'),
                    ),
                  ),
                ],
              ),
      ],
    );
  }
}
