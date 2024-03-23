import 'package:flutter/material.dart';
import 'package:hop_pos/src/common/widgets/info_banner.dart';
import 'package:hop_pos/src/common/widgets/text_input.dart';
import 'package:hop_pos/src/customers/models/customer.dart';
import 'package:hop_pos/src/customers/widgets/pos_customer_latest_screening_btn.dart';

class CustomerDetailDialog extends StatelessWidget {
  const CustomerDetailDialog({super.key, required this.customer, required this.haveScreening});
  final Customer customer;
  final bool haveScreening;

  @override
  Widget build(BuildContext context) {
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
                  content: customer.fullName,
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
                PosCustomerLatestScreeningBtn(customer: customer),
              ],
            )
          ],
        ],
      ),
    );
  }
}
