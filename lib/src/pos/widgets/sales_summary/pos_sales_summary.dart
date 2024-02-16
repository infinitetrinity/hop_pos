import 'package:flutter/material.dart';
import 'package:hop_pos/app/app_colors.dart';
import 'package:hop_pos/src/pos/widgets/sales_summary/pos_sales_summary_header.dart';
import 'package:hop_pos/src/pos/widgets/sales_summary/pos_sales_summary_items_list.dart';
import 'package:hop_pos/src/pos/widgets/sales_summary/pos_sales_summary_total_list.dart';

class PosSalesSummary extends StatelessWidget {
  const PosSalesSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 480,
      constraints: const BoxConstraints(minHeight: 650),
      decoration: const BoxDecoration(
        border: Border(
          right: BorderSide(color: AppColors.gray300),
        ),
      ),
      padding: const EdgeInsets.only(right: 20),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PosSalesSummaryHeader(),
          SizedBox(height: 10),
          PosSalesSummaryItemsList(),
          PosSalesSummaryTotalList(),
        ],
      ),
    );
  }
}
