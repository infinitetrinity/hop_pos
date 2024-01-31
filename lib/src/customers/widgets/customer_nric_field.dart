import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hop_pos/src/common/widgets/form_text_field.dart';
import 'package:hop_pos/src/customers/controllers/customer_controller.dart';
import 'package:hop_pos/src/customers/models/customer.dart';

class CustomerNricField extends HookConsumerWidget {
  const CustomerNricField({
    super.key,
    required this.formKey,
    this.label = "NRIC/FIN/Passport No.",
    this.value,
    this.customer,
    required this.onChanged,
    this.validator,
    this.validateUnique = true,
  });
  final GlobalKey<FormState> formKey;
  final String label;
  final String? value;
  final Customer? customer;
  final void Function(String, Customer?) onChanged;
  final String? validator;
  final bool validateUnique;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isValidating = useState(false);
    final error = useState<String?>(null);

    void isUnique(String value) {
      EasyDebounce.debounce('customer-check-nric', const Duration(milliseconds: 500), () async {
        isValidating.value = true;
        final isTaken = value.isEmpty
            ? null
            : await ref.read(customerControllerProvider.notifier).findByNric(nric: value, excludeId: customer?.id);
        isValidating.value = false;
        if (validateUnique) {
          error.value = isTaken != null ? "NRIC/FIN is already taken, please try another." : null;
        }

        onChanged(value, isTaken);
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
        onChanged(value, null);
        isUnique(value);
      },
    );
  }
}
