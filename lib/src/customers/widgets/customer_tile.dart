import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hop_pos/app/app_colors.dart';
import 'package:hop_pos/app/app_styles.dart';
import 'package:hop_pos/src/customers/models/customer_with_registration.dart';

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
            if (item.customer.isPending || item.hasSales) ...[
              const SizedBox(height: 5),
              Row(
                children: [
                  if (item.hasSales) ...[
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                      decoration: const BoxDecoration(
                        color: AppColors.green600,
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                      child: Text(
                        'Sales',
                        style: AppStyles.bodySmall.copyWith(
                          color: AppColors.white,
                          fontWeight: FontWeight.w600,
                          height: 1,
                        ),
                      ),
                    ),
                    const SizedBox(width: 6),
                  ],
                  if (item.customer.isPending)
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                      decoration: const BoxDecoration(
                        color: AppColors.yellow500,
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                      child: Text(
                        'Pending Acc',
                        style: AppStyles.bodySmall.copyWith(
                          color: AppColors.white,
                          fontWeight: FontWeight.w600,
                          height: 1,
                        ),
                      ),
                    ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }
}
