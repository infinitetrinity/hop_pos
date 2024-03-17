import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hop_pos/app/app_colors.dart';
import 'package:hop_pos/routes/pos_routes.dart';
import 'package:hop_pos/src/common/widgets/form_button.dart';
import 'package:hop_pos/src/customers/controllers/customer_controller.dart';
import 'package:hop_pos/src/customers/models/customer.dart';
import 'package:loader_overlay/loader_overlay.dart';

class PosCustomerLatestScreeningBtn extends ConsumerWidget {
  const PosCustomerLatestScreeningBtn({super.key, required this.customer});
  final Customer customer;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final focusNode = FocusNode();
    FocusScope.of(context).requestFocus(focusNode);

    void transactLatestScreening() async {
      context.loaderOverlay.show();
      final result = await ref.read(customerControllerProvider.notifier).setLatestScreeningPos(customer);

      if (context.mounted) {
        context.pop();
        context.loaderOverlay.hide();
        if (result) {
          PosRoute().go(context);
        }
      }
    }

    return RawKeyboardListener(
      focusNode: focusNode,
      onKey: (RawKeyEvent event) {
        if (event is RawKeyDownEvent && event.logicalKey == LogicalKeyboardKey.enter) {
          transactLatestScreening();
        }
      },
      child: FormButton(
        text: 'POS Latest Screening (Enter)',
        background: AppColors.brand600,
        maxWidth: 270,
        onSubmit: transactLatestScreening,
      ),
    );
  }
}
