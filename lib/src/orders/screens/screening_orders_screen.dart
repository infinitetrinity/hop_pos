import 'package:flutter/material.dart';
import 'package:hop_pos/app/app_styles.dart';
import 'package:hop_pos/src/common/widgets/layout.dart';
import 'package:hop_pos/src/orders/widgets/screening_sales_back_btn.dart';
import 'package:hop_pos/src/orders/widgets/screening_sales_table.dart';
import 'package:hop_pos/src/orders/widgets/screenings_sales_search_input.dart';
import 'package:hop_pos/src/screenings/models/screening.dart';

class ScreeningOrdersScreen extends StatelessWidget {
  const ScreeningOrdersScreen({super.key, required this.screening});
  final Screening screening;

  @override
  Widget build(BuildContext context) {
    return Layout(
      Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 900,
                  child: Text(
                    'Sales of ${screening.name}',
                    style: AppStyles.body.copyWith(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const ScreeningSalesBackBtn(),
              ],
            ),
            const SizedBox(height: 20),
            const ScreeningsSalesSearchInput(),
            ScreeningSalesTable(screening: screening),
          ],
        ),
      ),
    );
  }
}
