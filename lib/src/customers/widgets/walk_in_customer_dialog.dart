import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hop_pos/app/app_colors.dart';
import 'package:hop_pos/src/common/widgets/dialog_footer.dart';
import 'package:hop_pos/src/common/widgets/dialog_title.dart';
import 'package:hop_pos/src/common/widgets/form_checkbox.dart';
import 'package:hop_pos/src/common/widgets/form_date_dropdown.dart';
import 'package:hop_pos/src/common/widgets/form_dropdown_field.dart';
import 'package:hop_pos/src/common/widgets/form_text_field.dart';
import 'package:hop_pos/src/common/widgets/info_banner.dart';
import 'package:hop_pos/src/customers/models/customer.dart';
import 'package:hop_pos/src/customers/models/customer_form.dart';
import 'package:hop_pos/src/customers/widgets/customer_email_field.dart';
import 'package:hop_pos/src/customers/widgets/customer_form_detail.dart';
import 'package:hop_pos/src/customers/widgets/customer_mobile_field.dart';
import 'package:hop_pos/src/customers/widgets/customer_nric_field.dart';
import 'package:hop_pos/src/pos/controllers/pos_controller.dart';

class WalkInCustomerDialog extends HookConsumerWidget {
  const WalkInCustomerDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = useMemoized(() => GlobalKey<FormState>());
    final customer = useState<Customer?>(null);
    final form = useState(const CustomerForm(isNew: true));
    final isSubmitting = useState(false);
    final identityType = useState(Customer.identityTypes.keys.first);

    void submitWalkInCustomer() async {
      ref.read(posControllerProvider.notifier).selectCustomer(customer: customer.value!);
    }

    void handleSubmit({bool submit = false}) {
      EasyDebounce.debounce('customer-form', const Duration(milliseconds: 500), () async {
        isSubmitting.value = true;

        if (!formKey.currentState!.validate() || !submit) {
          isSubmitting.value = false;
          return;
        }

        if (customer.value != null) {
          submitWalkInCustomer();
        }

        if (context.mounted) {
          context.pop();
        }
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
                  const DialogTitle(title: 'Walk-in Customer'),
                  Container(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      children: [
                        customer.value == null
                            ? const InfoBanner(content: 'You will be creating a new customer')
                            : const InfoBanner(
                                content: 'Existing Customer found with NRIC/FIN number.',
                                color: AppColors.green200,
                              ),
                        const SizedBox(height: 25),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 130,
                              child: FormDropdownField(
                                label: 'Identity Type',
                                isRequired: true,
                                options: Customer.identityTypes,
                                value: identityType.value,
                                onChanged: (value) {
                                  identityType.value = value;
                                },
                              ),
                            ),
                            const SizedBox(width: 10),
                            Flexible(
                              child: CustomerNricField(
                                formKey: formKey,
                                label: identityType.value == 'nric' ? 'NRIC/FIN' : 'Other Identity No.',
                                value: form.value.nric,
                                validator: identityType.value == 'nric' ? form.value.validateNric(minLength: 9, label: "NRIC/FIN") : form.value.validateNric(),
                                validateUnique: false,
                                onChanged: (value, customerFound) {
                                  form.value = form.value.copyWith(nric: value, isNew: customerFound == null);
                                  customer.value = customerFound;
                                },
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        if (customer.value != null)
                          CustomerFormDetail(customer: customer.value!)
                        else ...[
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
                          const SizedBox(height: 20),
                          FormCheckbox(
                            label: 'Account invitation notification',
                            content: "Send customer a SMS and email invitation to create their account.",
                            value: form.value.sendAccountInvitation,
                            onTap: (value) {
                              form.value = form.value.copyWith(sendAccountInvitation: value);
                            },
                          ),
                        ],
                        const SizedBox(height: 25),
                        DialogFooter(
                          isSubmitting: isSubmitting.value,
                          onSubmit: () => handleSubmit(submit: true),
                          submitLabel: 'Add Customer',
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
