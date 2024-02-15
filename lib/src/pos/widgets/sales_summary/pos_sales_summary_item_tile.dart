import 'package:flutter/material.dart';
import 'package:hop_pos/app/app_colors.dart';
import 'package:hop_pos/app/app_styles.dart';
import 'package:hop_pos/src/order_items/models/order_item.dart';

class PosSalesSummaryItemTile extends StatelessWidget {
  const PosSalesSummaryItemTile({super.key, required this.item, required this.index});
  final OrderItem item;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        border: index == 1
            ? null
            : const Border(
                top: BorderSide(
                  color: AppColors.gray300,
                ),
              ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "$index)",
                style: AppStyles.body,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(width: 3),
              SizedBox(
                width: 350,
                child: Text(
                  "${item.name} (${item.sku})",
                  style: AppStyles.body,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          Flexible(
            child: Column(
              children: [
                Text(
                  item.displayNetPrice,
                  style: AppStyles.body,
                ),
                if (item.hasDiscount)
                  Text(
                    item.displayPrice,
                    style: AppStyles.body.copyWith(
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
