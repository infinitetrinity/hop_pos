import 'package:flutter/material.dart';
import 'package:hop_pos/app/app_styles.dart';
import 'package:hop_pos/src/common/widgets/layout.dart';
import 'package:hop_pos/src/orders/widgets/screening_sales_search_input.dart';
import 'package:hop_pos/src/orders/widgets/screening_sales_table.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

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
              'Screenings with sales made in the past 30 days',
              style: AppStyles.body.copyWith(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            const ScreeningSalesSearchInput(),
            const ScreeningSalesTable(),
          ],
        ),
      ),
    );
  }
}
