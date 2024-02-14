import 'package:flutter/material.dart';
import 'package:hop_pos/src/products/widgets/product_search_input.dart';

class PosProductControls extends StatelessWidget {
  const PosProductControls({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        ProductSearchInput(),
        SizedBox(height: 5),
      ],
    );
  }
}
