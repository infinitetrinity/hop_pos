import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hop_pos/src/pos/controllers/pos_controller.dart';
import 'package:hop_pos/src/products/models/product.dart';
import 'package:hop_pos/src/products/models/product_form.dart';
import 'package:hop_pos/src/products/widgets/product_dialog_form.dart';

class CustomProductDialog extends ConsumerWidget {
  const CustomProductDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void onSubmit(ProductForm form, Product? product) async {
      await ref.read(posControllerProvider.notifier).addProduct(form);
      if (context.mounted) {
        context.pop();
      }
    }

    return ProductDialogForm(
      title: 'Add Custom Product',
      isCustom: true,
      onSubmit: onSubmit,
    );
  }
}
