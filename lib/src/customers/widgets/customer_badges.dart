import 'package:flutter/material.dart';
import 'package:hop_pos/app/app_colors.dart';
import 'package:hop_pos/src/common/widgets/custom_badge.dart';
import 'package:hop_pos/src/customers/models/customer.dart';

class CustomerBadges extends StatelessWidget {
  const CustomerBadges({super.key, required this.customer});
  final Customer customer;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (customer.isPending)
          const Padding(
            padding: EdgeInsets.only(right: 5),
            child: CustomBadge(text: 'Pending Acc', bgColor: AppColors.yellow500),
          ),
        if (customer.isNew)
          const Padding(
            padding: EdgeInsets.only(right: 5),
            child: CustomBadge(text: 'New', bgColor: AppColors.blue400),
          ),
      ],
    );
  }
}
