import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hop_pos/app/app_colors.dart';
import 'package:hop_pos/src/common/widgets/form_button.dart';
import 'package:hop_pos/src/common/widgets/info_banner.dart';
import 'package:hop_pos/src/common/widgets/text_input.dart';
import 'package:hop_pos/src/customers/controllers/customer_controller.dart';
import 'package:hop_pos/src/customers/models/customer.dart';

class CustomerDetailDialog extends ConsumerWidget {
  const CustomerDetailDialog({super.key, required this.customer, required this.haveScreening});
  final Customer customer;
  final bool haveScreening;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void transactLatestScreening() async {
      await ref.read(customerControllerProvider.notifier).setLatestScreeningPos(customer);
    }

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
      child: Column(
        children: [
          if (customer.isNew) ...[
            const InfoBanner(
              content: 'Customer is newly created and have not been synced.',
            ),
            const SizedBox(height: 25),
          ],
          Row(
            children: [
              Flexible(
                child: TextInput(
                  label: 'NRIC/Passport No.',
                  content: customer.nric ?? '',
                ),
              ),
              const SizedBox(width: 10),
              Flexible(
                child: TextInput(
                  label: 'Full Name',
                  content: customer.fullName ?? '',
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Flexible(
                child: TextInput(
                  label: 'Email',
                  content: customer.email ?? '',
                ),
              ),
              const SizedBox(width: 10),
              Flexible(
                child: TextInput(
                  label: 'Mobile No.',
                  content: customer.mobileNo ?? '',
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Flexible(
                child: TextInput(
                  label: 'Date of birth',
                  content: customer.displayDob ?? '',
                ),
              ),
              const SizedBox(width: 10),
              Flexible(
                child: TextInput(
                  label: 'Gender',
                  content: customer.displayGender ?? '',
                ),
              ),
            ],
          ),
          if (haveScreening) ...[
            const SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FormButton(
                  text: 'Transact Latest Screening',
                  background: AppColors.brand600,
                  maxWidth: 240,
                  onSubmit: transactLatestScreening,
                ),
              ],
            )
          ],
        ],
      ),
    );
  }
}
