import 'package:flutter/material.dart';
import 'package:hop_pos/app/app_styles.dart';
import 'package:hop_pos/src/common/widgets/layout.dart';
import 'package:hop_pos/src/orders/widgets/incomplete_sales_table.dart';
import 'package:hop_pos/src/orders/widgets/screenings_sales_search_input.dart';

class IncompleteOrdersScreen extends StatelessWidget {
  const IncompleteOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Layout(
      Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Incomplete sales in the past 30 days',
              style: AppStyles.body.copyWith(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            const ScreeningsSalesSearchInput(),
            const IncompleteSalesTable(),
          ],
        ),
      ),
    );
  }
}
