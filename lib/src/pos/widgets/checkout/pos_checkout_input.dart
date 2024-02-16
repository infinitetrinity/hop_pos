import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hop_pos/app/app_styles.dart';
import 'package:hop_pos/src/common/formatter/decimal_input_formatter.dart';
import 'package:hop_pos/src/common/widgets/form_text_field.dart';
import 'package:hop_pos/src/pos/controllers/pos_controller.dart';

class PosCheckoutInput extends HookConsumerWidget {
  const PosCheckoutInput({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = useMemoized(() => GlobalKey<FormState>());
    final balance = ref.watch(posControllerProvider.select((prov) => prov.order?.balance ?? 0));
    final controller = useTextEditingController();

    useEffect(() {
      controller.text = balance.toString();
      controller.selection = TextSelection(
        baseOffset: 0,
        extentOffset: balance.toString().length,
      );

      WidgetsBinding.instance.addPostFrameCallback((_) async {
        if (context.mounted) {
          ref.read(posControllerProvider.notifier).setCheckoutAmount(balance);
        }
      });

      return null;
    });

    String? validateCheckout(String? value) {
      final amount = double.tryParse(value ?? '') ?? 0;
      return amount <= 0 ? "Payment amount cannot be equal or lower than 0." : null;
    }

    void onChange(String? value) {
      EasyDebounce.debounce('checkout-form', const Duration(milliseconds: 500), () async {
        formKey.currentState?.validate();
        ref.read(posControllerProvider.notifier).setCheckoutAmount(double.tryParse(value ?? '') ?? 0);
      });
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Pay',
          style: AppStyles.bodyLarge.copyWith(
            fontSize: 40,
          ),
        ),
        Form(
          key: formKey,
          child: Material(
            child: SizedBox(
              width: 200,
              child: FormTextField(
                value: balance.toString(),
                validator: (value) => validateCheckout(value),
                controller: controller,
                fontSize: 35,
                textAlign: TextAlign.right,
                autoFocus: true,
                inputFormatters: [DecimalInputFormatter(decimal: 2)],
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                onChanged: (value) => onChange(value),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
