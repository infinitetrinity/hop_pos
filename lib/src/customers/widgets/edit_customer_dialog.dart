import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hop_pos/src/customers/models/customer.dart';
import 'package:hop_pos/src/customers/models/customer_form.dart';
import 'package:hop_pos/src/customers/widgets/customer_dialog_form.dart';
import 'package:hop_pos/src/pos/controllers/pos_controller.dart';

class EditCustomerDialog extends HookConsumerWidget {
  const EditCustomerDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final customer = ref.watch(posControllerProvider.select((value) => value.customer))!;

    void onSubmit(CustomerForm form, Customer? customer) {
      print('submit edit form');
      context.pop();
    }

    return CustomerDialogForm(
      title: 'Update Customer Details',
      onSubmit: onSubmit,
      customer: customer,
    );
  }
}
