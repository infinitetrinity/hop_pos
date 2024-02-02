import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hop_pos/app/app_colors.dart';
import 'package:hop_pos/app/app_styles.dart';
import 'package:hop_pos/src/customers/models/customer_with_registration.dart';
import 'package:hop_pos/src/customers/widgets/customer_badges.dart';
import 'package:hop_pos/src/screening_registrations/widgets/screening_registration_badges.dart';

class CustomerTile extends HookWidget {
  const CustomerTile(this.item, {super.key});
  final CustomerWithRegistration item;

  @override
  Widget build(BuildContext context) {
    final isHover = useState(false);

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => isHover.value = true,
      onExit: (_) => isHover.value = false,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
        color: isHover.value ? AppColors.brand600 : AppColors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              item.customer.fullName,
              overflow: TextOverflow.ellipsis,
              style: AppStyles.bodyLarge.copyWith(
                fontWeight: FontWeight.w600,
                color: isHover.value ? AppColors.white : AppColors.gray800,
              ),
            ),
            const SizedBox(height: 3),
            Text(
              "Ref: ${item.registration.index} | ${item.customer.nric}",
              overflow: TextOverflow.ellipsis,
              style: AppStyles.body.copyWith(
                color: isHover.value ? AppColors.white : AppColors.gray500,
              ),
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                CustomerBadges(customer: item.customer),
                ScreeningRegistrationBadges(registration: item.registration)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
