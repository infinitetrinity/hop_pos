import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hop_pos/src/common/widgets/form_text_field.dart';
import 'package:hop_pos/src/customers/controllers/customer_controller.dart';
import 'package:hop_pos/src/customers/models/customer.dart';

class CustomerMobileField extends HookConsumerWidget {
  const CustomerMobileField({
    super.key,
    required this.formKey,
    this.label = "Mobile No.",
    this.value,
    this.customer,
    required this.onChanged,
    this.validator,
  });
  final GlobalKey<FormState> formKey;
  final String label;
  final String? value;
  final Customer? customer;
  final void Function(String) onChanged;
  final String? validator;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isValidating = useState(false);
    final error = useState<String?>(null);

    void isUnique(String value) {
      EasyDebounce.debounce('customer-check-mobile', const Duration(milliseconds: 500), () async {
        isValidating.value = true;
        final isTaken = value.isEmpty ? false : await ref.read(customerControllerProvider.notifier).isMobileNoTaken(mobileNo: value, excludeId: customer?.id);
        isValidating.value = false;
        error.value = isTaken ? "Mobile No. is already taken, please try another." : null;
        formKey.currentState?.validate();
      });
    }

    return FormTextField(
      isRequired: true,
      label: label,
      value: value,
      isDisabled: isValidating.value,
      validator: (_) => error.value ?? validator,
      onChanged: (value) {
        onChanged(value);
        isUnique(value);
      },
    );
  }
}
