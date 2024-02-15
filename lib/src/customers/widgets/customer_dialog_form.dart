import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
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

class CustomerDialogForm extends HookWidget {
  const CustomerDialogForm({
    super.key,
    required this.title,
    this.customer,
    required this.onSubmit,
    this.isWalkIn = false,
  });
  final String title;
  final Customer? customer;
  final void Function(CustomerForm form, Customer? customer) onSubmit;
  final bool isWalkIn;

  @override
  Widget build(BuildContext context) {
    final formKey = useMemoized(() => GlobalKey<FormState>());
    final customerState = useState<Customer?>(customer);
    final form = useState(customer == null
        ? CustomerForm(
            isNew: isWalkIn,
          )
        : CustomerForm.fromModel(customer!));
    final isSubmitting = useState(false);
    final identityType = useState(Customer.identityTypes.keys.first);

    void handleSubmit({bool submit = false}) {
      EasyDebounce.debounce('customer-form', const Duration(milliseconds: 500), () async {
        isSubmitting.value = true;

        if (formKey.currentState!.validate() && submit) {
          onSubmit(form.value, customerState.value);
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
                        if (form.value.isNew)
                          const InfoBanner(
                            content: 'You will be creating a new customer',
                          ),
                        if (isWalkIn && !form.value.isNew)
                          const InfoBanner(
                            content: 'Existing Customer found with NRIC/FIN number.',
                            color: AppColors.green200,
                          ),
                        const SizedBox(height: 25),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (isWalkIn) ...[
                              SizedBox(
                                width: 130,
                                child: FormDropdownField(
                                  label: 'Identity Type',
                                  isRequired: true,
                                  options: Customer.identityTypes,
                                  value: identityType.value,
                                  onChanged: (value) {
                                    identityType.value = value;
                                    handleSubmit();
                                  },
                                ),
                              ),
                              const SizedBox(width: 10),
                              Flexible(
                                child: CustomerNricField(
                                  formKey: formKey,
                                  label: identityType.value == 'nric' ? 'NRIC/FIN' : 'Other Identity No.',
                                  value: form.value.nric,
                                  validator: identityType.value == 'nric'
                                      ? form.value.validateNric(minLength: 9, label: "NRIC/FIN")
                                      : form.value.validateNric(),
                                  validateUnique: false,
                                  onChanged: (value, customerFound) {
                                    form.value = form.value.copyWith(nric: value, isNew: customerFound == null);
                                    customerState.value = customerFound;
                                  },
                                ),
                              ),
                            ],
                            if (!isWalkIn)
                              Flexible(
                                child: CustomerNricField(
                                  formKey: formKey,
                                  value: form.value.nric,
                                  validator: form.value.validateNric(),
                                  customer: customer,
                                  onChanged: (value, _) {
                                    form.value = form.value.copyWith(nric: value);
                                  },
                                ),
                              ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        if (isWalkIn && customerState.value != null)
                          CustomerFormDetail(customer: customerState.value!)
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
                                  customer: customerState.value,
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
                                  customer: customerState.value,
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
                          if (form.value.isNew)
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
                          submitLabel: isWalkIn ? 'Add Customer' : 'Update',
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
