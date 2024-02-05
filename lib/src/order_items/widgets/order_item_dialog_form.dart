import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hop_pos/app/app_colors.dart';
import 'package:hop_pos/app/app_styles.dart';
import 'package:hop_pos/src/common/formatter/decimal_input_formatter.dart';
import 'package:hop_pos/src/common/widgets/dialog_footer.dart';
import 'package:hop_pos/src/common/widgets/dialog_title.dart';
import 'package:hop_pos/src/common/widgets/form_text_field.dart';
import 'package:hop_pos/src/order_items/models/order_item.dart';
import 'package:hop_pos/src/order_items/models/order_item_form.dart';
import 'package:hop_pos/src/orders/models/order.dart';

class OrderItemDialogForm extends HookWidget {
  const OrderItemDialogForm({
    super.key,
    required this.title,
    this.item,
    required this.onSubmit,
    this.isCustom = false,
  });
  final String title;
  final OrderItem? item;
  final void Function(OrderItemForm form) onSubmit;
  final bool isCustom;

  @override
  Widget build(BuildContext context) {
    final formKey = useMemoized(() => GlobalKey<FormState>());
    final form = useState(item == null ? OrderItemForm(isCustom: isCustom) : OrderItemForm.fromModel(item!));
    final isSubmitting = useState(false);

    void handleSubmit({bool submit = false}) {
      EasyDebounce.debounce('order-item-form', const Duration(milliseconds: 500), () async {
        isSubmitting.value = true;

        if (formKey.currentState!.validate() && submit) {
          onSubmit(form.value);
        }

        isSubmitting.value = false;
      });
    }

    return Center(
      child: Form(
        key: formKey,
        child: Material(
          child: IntrinsicHeight(
            child: Container(
              color: AppColors.white,
              width: 850,
              child: Column(
                children: [
                  DialogTitle(title: title),
                  Container(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Flexible(
                              child: FormTextField(
                                isRequired: true,
                                label: 'Product Name',
                                value: form.value.name,
                                validator: (_) => form.value.validateName(),
                                onChanged: (value) {
                                  form.value = form.value.copyWith(name: value);
                                  handleSubmit();
                                },
                              ),
                            ),
                            const SizedBox(width: 10),
                            Flexible(
                              child: FormTextField(
                                isRequired: true,
                                label: 'Product SKU',
                                value: form.value.sku,
                                validator: (_) => form.value.validateSku(),
                                isDisabled: !isCustom,
                                onChanged: (value) {
                                  form.value = form.value.copyWith(sku: value);
                                  handleSubmit();
                                },
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Flexible(
                              child: FormTextField(
                                isRequired: true,
                                label: 'Product Price',
                                value: form.value.price?.toString(),
                                validator: (_) => form.value.validatePrice(),
                                inputFormatters: [DecimalInputFormatter(decimal: 2)],
                                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                                onChanged: (value) {
                                  form.value = form.value.copyWith(price: double.tryParse(value));
                                  handleSubmit();
                                },
                              ),
                            ),
                            const SizedBox(width: 10),
                            Flexible(
                              child: FormTextField(
                                label: 'Product Discount',
                                value: form.value.discount?.toString(),
                                validator: (_) => form.value.validateDiscount(),
                                inputFormatters: [DecimalInputFormatter(decimal: 2)],
                                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                                onChanged: (value) {
                                  form.value = form.value.copyWith(
                                    discount: double.tryParse(value),
                                  );
                                  handleSubmit();
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

                                    handleSubmit();
                                  },
                                  child: Text(
                                    form.value.discountType == DiscountType.percentage ? 'Percentage %' : 'Dollar \$',
                                    style: AppStyles.bodySmall.copyWith(
                                      letterSpacing: 0,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        FormTextField(
                          label: 'Product Description',
                          value: form.value.description,
                          keyboardType: TextInputType.multiline,
                          minLines: 4,
                          maxLines: 4,
                          onChanged: (value) {
                            form.value = form.value.copyWith(description: value);
                          },
                        ),
                        const SizedBox(height: 25),
                        DialogFooter(
                          isSubmitting: isSubmitting.value,
                          onSubmit: () => handleSubmit(submit: true),
                          submitLabel: isCustom ? 'Submit' : 'Update',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
