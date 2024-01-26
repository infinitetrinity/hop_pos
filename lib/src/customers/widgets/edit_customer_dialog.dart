import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hop_pos/app/app_colors.dart';
import 'package:hop_pos/app/app_styles.dart';
import 'package:hop_pos/src/common/widgets/form_button.dart';
import 'package:hop_pos/src/common/widgets/form_date_dropdown.dart';
import 'package:hop_pos/src/common/widgets/form_dropdown_field.dart';
import 'package:hop_pos/src/common/widgets/form_text_field.dart';
import 'package:hop_pos/src/customers/controllers/customer_controller.dart';
import 'package:hop_pos/src/customers/models/customer.dart';
import 'package:hop_pos/src/customers/models/customer_form.dart';
import 'package:hop_pos/src/pos/controllers/pos_controller.dart';

class EditCustomerDialog extends HookConsumerWidget {
  const EditCustomerDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = useMemoized(() => GlobalKey<FormState>());
    final customer = ref.watch(posControllerProvider.select((value) => value.customer?.customer));
    final form = useState(customer == null ? const CustomerForm() : CustomerForm.fromModel(customer));
    final isSubmitting = useState(false);
    final nricError = useState<String?>(null);
    final mobileNoError = useState<String?>(null);
    final emailError = useState<String?>(null);

    Future<void> isNricUnique() async {
      final isUnique = await ref.read(customerControllerProvider.notifier).isNricUnique(nric: form.value.nric!, customerId: customer!.id);
      if (!isUnique) {
        nricError.value = "NRIC/FIN is already taken, please try another.";
        formKey.currentState!.validate();
      }
    }

    Future<void> isMobileNoUnique() async {
      final isUnique = await ref.read(customerControllerProvider.notifier).isMobileNoUnique(mobileNo: form.value.mobileNo!, customerId: customer!.id);
      if (!isUnique) {
        mobileNoError.value = "Mobile No. is already taken, please try another.";
        formKey.currentState!.validate();
      }
    }

    Future<void> isEmailUnique() async {
      final isUnique = await ref.read(customerControllerProvider.notifier).isEmailUnique(email: form.value.email!, customerId: customer!.id);
      if (!isUnique) {
        emailError.value = "Email is already taken, please try another.";
        formKey.currentState!.validate();
      }
    }

    void handleSubmit({bool submit = false}) {
      EasyDebounce.debounce('customer-form', const Duration(milliseconds: 500), () async {
        if (!context.mounted) {
          return;
        }

        isSubmitting.value = true;
        nricError.value = null;
        mobileNoError.value = null;
        emailError.value = null;

        if (formKey.currentState!.validate()) {
          await isNricUnique();
          await isMobileNoUnique();
          await isEmailUnique();

          if (formKey.currentState!.validate() && submit) {
            print('submit form');
          }
        }

        isSubmitting.value = false;
      });
    }

    return customer == null
        ? const SizedBox()
        : Center(
            child: Form(
              key: formKey,
              child: Material(
                child: IntrinsicHeight(
                  child: Container(
                    color: AppColors.white,
                    width: 800,
                    child: Column(
                      children: [
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                          color: AppColors.brand600,
                          child: Row(
                            children: [
                              Text(
                                'Update Customer Details',
                                style: AppStyles.bodyLarge.copyWith(
                                  fontSize: 19,
                                  color: AppColors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const Spacer(),
                              IconButton(
                                onPressed: () => context.pop(),
                                icon: const Icon(
                                  Icons.cancel,
                                  color: AppColors.white,
                                ),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.all(15),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FormTextField(
                                  isRequired: true,
                                  label: 'NRIC/FIN/Passport No.',
                                  value: form.value.nric,
                                  isDisabled: isSubmitting.value,
                                  validator: (_) => form.value.validateNric() ?? nricError.value,
                                  onChanged: (value) {
                                    form.value = form.value.copyWith(nric: value);
                                    handleSubmit();
                                  },
                                ),
                                const SizedBox(height: 20),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Flexible(
                                      flex: 1,
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
                                      flex: 1,
                                      child: FormTextField(
                                        label: 'Mobile No.',
                                        value: form.value.mobileNo,
                                        isDisabled: isSubmitting.value,
                                        validator: (_) => form.value.validateMobileNo() ?? mobileNoError.value,
                                        onChanged: (value) {
                                          form.value = form.value.copyWith(mobileNo: value);
                                          handleSubmit();
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
                                        },
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(height: 20),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Flexible(
                                      flex: 1,
                                      child: FormTextField(
                                        isRequired: true,
                                        label: 'Email',
                                        value: form.value.email,
                                        isDisabled: isSubmitting.value,
                                        validator: (_) => form.value.validateEmail() ?? emailError.value,
                                        onChanged: (value) {
                                          form.value = form.value.copyWith(email: value);
                                          handleSubmit();
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
                                const SizedBox(height: 30),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    FormButton(
                                      text: 'Cancel',
                                      background: AppColors.gray500,
                                      maxWidth: 100,
                                      onSubmit: () => context.pop(),
                                    ),
                                    const SizedBox(width: 10),
                                    FormButton(
                                      text: 'Update',
                                      maxWidth: 100,
                                      isSubmitting: isSubmitting.value,
                                      onSubmit: () => handleSubmit(submit: true),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
  }
}
