import 'package:flutter/material.dart';
import 'package:hop_pos/src/common/widgets/layout.dart';
import 'package:hop_pos/src/products/widgets/product_search_input.dart';

class PosScreen extends StatelessWidget {
  const PosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Layout(
      Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            flex: 4,
            child: Column(
              children: [
                ProductSearchInput(),
              ],
            ),
          ),
          SizedBox(width: 30),
          Flexible(
            fit: FlexFit.loose,
            flex: 2,
            child: Column(
              children: [],
            ),
          ),
        ],
      ),
    );
  }
}