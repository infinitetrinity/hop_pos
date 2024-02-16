import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hop_pos/src/pos/controllers/pos_controller.dart';
import 'package:hop_pos/src/pos/widgets/sales_summary/pos_sales_summary_item_tile.dart';

class PosSalesSummaryItemsList extends ConsumerWidget {
  const PosSalesSummaryItemsList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final items = ref.watch(posControllerProvider.select((value) => value.order?.items));

    return items == null
        ? Container()
        : SizedBox(
            height: 280,
            child: ListView.builder(
              shrinkWrap: true,
              physics: const AlwaysScrollableScrollPhysics(),
              itemCount: items.length,
              itemBuilder: (context, index) => PosSalesSummaryItemTile(
                item: items[index],
                index: index + 1,
              ),
            ),
          );
  }
}
