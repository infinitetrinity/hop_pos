import 'package:flutter/material.dart';
import 'package:hop_pos/src/pos/widgets/pos_back_btn.dart';
import 'package:hop_pos/src/pos/widgets/pos_discard_sales_btn.dart';
import 'package:hop_pos/src/pos/widgets/pos_screening.dart';

class PosHeader extends StatelessWidget {
  const PosHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        PosScreening(),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            PosDiscardSalesBtn(),
            SizedBox(width: 10),
            PosBackBtn(),
          ],
        ),
      ],
    );
  }
}
