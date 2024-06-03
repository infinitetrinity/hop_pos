import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hop_pos/src/common/services/print_service.dart';
import 'package:hop_pos/src/pos/controllers/pos_controller.dart';
import 'package:hop_pos/src/pos/widgets/completed/pos_completed_back_to_payment_btn.dart';
import 'package:hop_pos/src/pos/widgets/completed/pos_completed_customer.dart';
import 'package:hop_pos/src/pos/widgets/completed/pos_completed_done_btn.dart';
import 'package:hop_pos/src/pos/widgets/completed/pos_completed_e_receipt.dart';
import 'package:hop_pos/src/pos/widgets/completed/pos_completed_header.dart';
import 'package:hop_pos/src/pos/widgets/completed/pos_completed_screening.dart';

class PosCompleted extends HookConsumerWidget {
  const PosCompleted({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isUtfOrStf = ref.watch(posControllerProvider.select((prov) => prov.order?.isStfOrUtf ?? false));
    final subtotal = ref.watch(posControllerProvider.select((prov) => prov.order?.subtotal ?? 0));

    printReceipts() async {
      final printService = await ref.read(printServiceProvider.future);

      if (subtotal > 0) {
        await printService.printOrderReceipt();
        await printService.printOrderReceipt();
      }

      if (isUtfOrStf) {
        await printService.printUtfStfReceipt();
      }
    }

    useEffect(() {
      printReceipts();
      return null;
    }, []);

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
            PosCompletedBackToPaymentBtn(),
          ],
        ),
      ),
    );
  }
}
