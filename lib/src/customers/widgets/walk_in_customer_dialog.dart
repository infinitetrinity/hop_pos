import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hop_pos/src/customers/models/customer.dart';
import 'package:hop_pos/src/customers/models/customer_form.dart';
import 'package:hop_pos/src/customers/widgets/customer_dialog_form.dart';
import 'package:hop_pos/src/pos/controllers/pos_controller.dart';

class WalkInCustomerDialog extends ConsumerWidget {
  const WalkInCustomerDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Future<void> onSubmit(CustomerForm form, Customer? customer) async {
      customer != null
          ? await ref.read(posControllerProvider.notifier).selectCustomer(customer: customer)
          : await ref.read(posControllerProvider.notifier).addNewCustomer(form);

      if (context.mounted) {
        context.pop();
      }
    }

    return CustomerDialogForm(
      title: 'Walk-in Customer',
      isWalkIn: true,
      onSubmit: onSubmit,
    );
  }
}
