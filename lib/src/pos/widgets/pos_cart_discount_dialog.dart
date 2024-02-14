import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hop_pos/app/app_colors.dart';
import 'package:hop_pos/app/app_styles.dart';
import 'package:hop_pos/src/common/formatter/decimal_input_formatter.dart';
import 'package:hop_pos/src/common/widgets/dialog_footer.dart';
import 'package:hop_pos/src/common/widgets/dialog_title.dart';
import 'package:hop_pos/src/common/widgets/form_text_field.dart';
import 'package:hop_pos/src/orders/models/order.dart';
import 'package:hop_pos/src/orders/models/order_discount_form.dart';
import 'package:hop_pos/src/pos/controllers/pos_controller.dart';

class PosCartDiscountDialog extends HookConsumerWidget {
  const PosCartDiscountDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final order = ref.watch(posControllerProvider.select((prov) => prov.order?.order));
    final balance = ref.watch(posControllerProvider.select((prov) => prov.order?.balanceBeforeDiscount ?? 0));

    final form = useState(order == null
        ? const OrderDiscountForm(discountType: DiscountType.percentage)
        : OrderDiscountForm.fromModel(order));
    final formKey = useMemoized(() => GlobalKey<FormState>());
    final isSubmitting = useState(false);

    void onSubmit() {
      EasyDebounce.debounce('discount-form', const Duration(milliseconds: 500), () async {
        isSubmitting.value = true;

        if (formKey.currentState!.validate()) {
          await ref.read(posControllerProvider.notifier).setDiscount(form.value);

          if (context.mounted) {
            context.pop();
          }
        }

        isSubmitting.value = false;
      });
    }

    return Center(
      child: Form(
        key: formKey,
        child: Material(
          child: Container(
            height: 280,
            color: AppColors.white,
            width: 570,
            child: Column(
              children: [
                const DialogTitle(title: 'Cart Discount'),
                Container(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    children: [
                      FormTextField(
                        label: 'Cart Discount',
                        value: form.value.discount?.toString(),
                        validator: (_) => form.value.validateDiscount(balance),
                        inputFormatters: [DecimalInputFormatter(decimal: 2)],
                        keyboardType: const TextInputType.numberWithOptions(decimal: true),
                        onChanged: (value) {
                          form.value = form.value.copyWith(
                            discount: double.tryParse(value),
                          );
                        },
                        suffixIcon: TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: AppColors.gray200,
                            foregroundColor: AppColors.white,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(3),
                                bottomRight: Radius.circular(3),
                              ),
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
                          ),
                          onPressed: () {
                            form.value = form.value.copyWith(
                              discountType: form.value.discountType == DiscountType.percentage
                                  ? DiscountType.dollars
                                  : DiscountType.percentage,
                            );
                          },
                          child: Text(
                            form.value.discountType == DiscountType.percentage ? 'Percentage %' : 'Dollar \$',
                            style: AppStyles.bodySmall.copyWith(
                              letterSpacing: 0,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 25),
                      DialogFooter(
                        isSubmitting: isSubmitting.value,
                        onSubmit: () => onSubmit(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
