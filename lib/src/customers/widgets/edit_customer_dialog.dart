import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hop_pos/app/app_colors.dart';
import 'package:hop_pos/src/common/widgets/dialog_footer.dart';
import 'package:hop_pos/src/common/widgets/dialog_title.dart';
import 'package:hop_pos/src/common/widgets/form_date_dropdown.dart';
import 'package:hop_pos/src/common/widgets/form_dropdown_field.dart';
import 'package:hop_pos/src/common/widgets/form_text_field.dart';
import 'package:hop_pos/src/customers/models/customer.dart';
import 'package:hop_pos/src/customers/models/customer_form.dart';
import 'package:hop_pos/src/customers/widgets/customer_email_field.dart';
import 'package:hop_pos/src/customers/widgets/customer_mobile_field.dart';
import 'package:hop_pos/src/customers/widgets/customer_nric_field.dart';
import 'package:hop_pos/src/pos/controllers/pos_controller.dart';

class EditCustomerDialog extends HookConsumerWidget {
  const EditCustomerDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = useMemoized(() => GlobalKey<FormState>());
    final customer = ref.watch(posControllerProvider.select((value) => value.customer))!;
    final form = useState(CustomerForm.fromModel(customer));
    final isSubmitting = useState(false);

    void handleSubmit({bool submit = false}) {
      EasyDebounce.debounce('customer-form', const Duration(milliseconds: 500), () async {
        isSubmitting.value = true;

        if (formKey.currentState!.validate() && submit) {
          print('submit form');
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
              width: 800,
              child: Column(
                children: [
                  const DialogTitle(title: 'Update Customer Details'),
                  Container(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomerNricField(
                          formKey: formKey,
                          value: form.value.nric,
                          validator: form.value.validateNric(),
                          customer: customer,
                          onChanged: (value, _) {
                            form.value = form.value.copyWith(nric: value);
                          },
                        ),
                        const SizedBox(height: 20),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Flexible(
                              child: FormTextField(
                                isRequired: true,
                                label: 'Full Name',
                                value: form.value.fullName,
                                validator: (_) => form.value.validateFullName(),
                                onChanged: (value) {
                                  form.value = form.value.copyWith(fullName: value);
                                  handleSubmit();
                                },
                              ),
                            ),
                            const SizedBox(width: 10),
                            Flexible(
                              child: CustomerMobileField(
                                formKey: formKey,
                                value: form.value.mobileNo,
                                validator: form.value.validateMobileNo(),
                                customer: customer,
                                onChanged: (value) {
                                  form.value = form.value.copyWith(mobileNo: value);
                                },
                              ),
                            ),
                            const SizedBox(width: 10),
                            SizedBox(
                              width: 130,
                              child: FormDropdownField(
                                label: 'Gender',
                                options: Customer.genders,
                                value: form.value.gender,
                                onChanged: (value) {
                                  form.value = form.value.copyWith(gender: value);
                                  handleSubmit();
                                },
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Flexible(
                              child: CustomerEmailField(
                                formKey: formKey,
                                value: form.value.email,
                                validator: form.value.validateEmail(),
                                customer: customer,
                                onChanged: (value) {
                                  form.value = form.value.copyWith(email: value);
                                },
                              ),
                            ),
                            const SizedBox(width: 10),
                            SizedBox(
                              width: 350,
                              child: FormDateDropdown(
                                label: 'Date of birth',
                                isRequired: true,
                                value: form.value.dob,
                                validator: (_) => form.value.validateDob(),
                                onChanged: (value) {
                                  form.value = form.value.copyWith(dob: value);
                                  handleSubmit();
                                },
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 25),
                        DialogFooter(
                          isSubmitting: isSubmitting.value,
                          onSubmit: () => handleSubmit(submit: true),
                          submitLabel: 'Update',
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
