import 'package:flutter/material.dart';
import 'package:hop_pos/src/common/widgets/layout.dart';
import 'package:hop_pos/src/pos/widgets/pos_customer.dart';
import 'package:hop_pos/src/pos/widgets/pos_screening.dart';
import 'package:hop_pos/src/products/widgets/product_search_input.dart';
import 'package:hop_pos/src/products/widgets/products_list.dart';

class PosScreen extends StatelessWidget {
  const PosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Layout(
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 780,
            child: Column(
              children: [
                ProductSearchInput(),
                SizedBox(height: 10),
                ProductsList(),
              ],
            ),
          ),
          SizedBox(width: 30),
          Flexible(
            child: Column(
              children: [
                PosScreening(),
                PosCustomer(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
