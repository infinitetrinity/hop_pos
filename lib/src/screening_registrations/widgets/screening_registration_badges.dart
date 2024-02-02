import 'package:flutter/material.dart';
import 'package:hop_pos/app/app_colors.dart';
import 'package:hop_pos/src/common/widgets/custom_badge.dart';
import 'package:hop_pos/src/screening_registrations/models/screening_registration.dart';

class ScreeningRegistrationBadges extends StatelessWidget {
  const ScreeningRegistrationBadges({super.key, required this.registration});
  final ScreeningRegistration registration;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (registration.isNew)
          const Padding(
            padding: EdgeInsets.only(right: 5),
            child: CustomBadge(text: 'Walk-in', bgColor: AppColors.purple600),
          ),
        if (registration.hasOrders)
          const Padding(
            padding: EdgeInsets.only(right: 5),
            child: CustomBadge(text: 'Sales', bgColor: AppColors.green600),
          ),
      ],
    );
  }
}
