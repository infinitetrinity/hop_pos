import 'package:flutter/material.dart';
import 'package:hop_pos/src/common/widgets/layout.dart';
import 'package:hop_pos/src/pos/widgets/pos_cart_total.dart';
import 'package:hop_pos/src/pos/widgets/pos_customer.dart';
import 'package:hop_pos/src/pos/widgets/pos_header.dart';
import 'package:hop_pos/src/pos/widgets/pos_invoice.dart';
import 'package:hop_pos/src/pos/widgets/pos_items.dart';
import 'package:hop_pos/src/pos/widgets/pos_product_controls.dart';
import 'package:hop_pos/src/products/widgets/products_list.dart';

class PosScreen extends StatelessWidget {
  const PosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Layout(
      Column(
        children: [
          PosHeader(),
          SizedBox(height: 15),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 750,
                child: Column(
                  children: [
                    PosProductControls(),
                    ProductsList(),
                  ],
                ),
              ),
              SizedBox(width: 30),
              Flexible(
                child: Column(
                  children: [
                    PosInvoice(),
                    PosCustomer(),
                    PosItems(),
                    PosCartTotal(),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
