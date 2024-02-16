import 'package:flutter/material.dart';
import 'package:hop_pos/src/pos/widgets/completed/pos_completed_customer.dart';
import 'package:hop_pos/src/pos/widgets/completed/pos_completed_done_btn.dart';
import 'package:hop_pos/src/pos/widgets/completed/pos_completed_e_receipt.dart';
import 'package:hop_pos/src/pos/widgets/completed/pos_completed_header.dart';
import 'package:hop_pos/src/pos/widgets/completed/pos_completed_screening.dart';

class PosCompleted extends StatelessWidget {
  const PosCompleted({super.key});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        padding: const EdgeInsets.only(left: 20),
        child: const Column(
          children: [
            PosCompletedHeader(),
            SizedBox(height: 30),
            PosCompletedScreening(),
            SizedBox(height: 15),
            PosCompletedCustomer(),
            SizedBox(height: 15),
            PosCompletedEReceipt(),
            SizedBox(height: 30),
            PosCompletedDoneBtn(),
          ],
        ),
      ),
    );
  }
}
