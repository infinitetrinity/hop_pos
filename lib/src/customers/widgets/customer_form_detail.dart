import 'package:flutter/material.dart';
import 'package:hop_pos/src/common/widgets/text_input.dart';
import 'package:hop_pos/src/customers/models/customer.dart';

class CustomerFormDetail extends StatelessWidget {
  const CustomerFormDetail({super.key, required this.customer});
  final Customer customer;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Flexible(
              child: TextInput(
                label: 'Full Name',
                content: customer.fullName,
              ),
            ),
            const SizedBox(width: 10),
            Flexible(
              child: TextInput(
                label: 'Email',
                content: customer.email ?? '',
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            Flexible(
              child: TextInput(
                label: 'Mobile No.',
                content: customer.mobileNo ?? '',
              ),
            ),
            const SizedBox(width: 10),
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
      ],
    );
  }
}
