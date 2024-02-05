import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hop_pos/src/order_items/models/order_item.dart';
import 'package:hop_pos/src/order_items/models/order_item_form.dart';
import 'package:hop_pos/src/order_items/widgets/order_item_dialog_form.dart';
import 'package:hop_pos/src/pos/controllers/pos_controller.dart';

class EditOrderItemDialog extends ConsumerWidget {
  const EditOrderItemDialog({
    super.key,
    required this.item,
  });
  final OrderItem item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void onSubmit(OrderItemForm form) async {
      await ref.read(posControllerProvider.notifier).updateOrderItem(form);
      if (context.mounted) {
        context.pop();
      }
    }

    return OrderItemDialogForm(
      title: 'Edit Cart Product',
      item: item,
      onSubmit: onSubmit,
    );
  }
}
