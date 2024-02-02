import 'package:flutter/material.dart';
import 'package:hop_pos/src/pos/widgets/pos_discard_sales_btn.dart';

class PosControls extends StatelessWidget {
  const PosControls({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        PosDiscaordSalesBtn(),
      ],
    );
  }
}
