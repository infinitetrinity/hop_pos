import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hop_pos/src/order_items/models/order_item_form.dart';
import 'package:hop_pos/src/order_items/widgets/order_item_dialog_form.dart';
import 'package:hop_pos/src/pos/controllers/pos_controller.dart';

class CustomOrderItemDialog extends ConsumerWidget {
  const CustomOrderItemDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void onSubmit(OrderItemForm form) async {
      await ref.read(posControllerProvider.notifier).addProduct(form);
      if (context.mounted) {
        context.pop();
      }
    }

    return OrderItemDialogForm(
      title: 'Add Custom Product',
      isCustom: true,
      onSubmit: onSubmit,
    );
  }
}
