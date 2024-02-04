import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hop_pos/app/app_colors.dart';
import 'package:hop_pos/app/app_styles.dart';
import 'package:hop_pos/src/common/widgets/form_search_input.dart';
import 'package:hop_pos/src/common/widgets/search_list.dart';
import 'package:hop_pos/src/pos/controllers/pos_controller.dart';
import 'package:hop_pos/src/products/models/product_with_category.dart';
import 'package:hop_pos/src/products/states/products_search_state.dart';
import 'package:hop_pos/src/products/widgets/product_tile.dart';

class ProductSearchInput extends HookConsumerWidget {
  const ProductSearchInput({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TypeAheadField<ProductWithCategory>(
      suggestionsCallback: (search) => ref.read(productsSearchStateProvider(search).future),
      builder: (context, controller, focusNode) => FormSearchTextInput(
        controller: controller,
        focusNode: focusNode,
        label: 'Search Product',
      ),
      listBuilder: (context, children) => SearchList(children),
      itemBuilder: (context, product) => ProductTile(product),
      emptyBuilder: (context) => Container(
        padding: const EdgeInsets.all(12),
        color: AppColors.white,
        width: double.infinity,
        child: Text(
          'No Product found',
          style: AppStyles.body,
        ),
      ),
      onSelected: (item) async {
        await ref.read(posControllerProvider.notifier).addProduct(item.product);
      },
    );
  }
}
