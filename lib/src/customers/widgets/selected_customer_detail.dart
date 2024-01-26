import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hop_pos/app/app_colors.dart';
import 'package:hop_pos/app/app_extension.dart';
import 'package:hop_pos/app/app_styles.dart';
import 'package:hop_pos/src/pos/controllers/pos_controller.dart';

class SelectedCustomerDetail extends ConsumerWidget {
  const SelectedCustomerDetail({super.key, required this.isHover});
  final bool isHover;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selected = ref.watch(posControllerProvider.select((prov) => prov.customer));

    return selected == null
        ? const SizedBox()
        : Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${selected.customer.fullName} ${selected.customer.nric.isNullOrEmpty ? '' : '(${selected.customer.nric})'}",
                    style: AppStyles.bodyLarge.copyWith(
                      fontWeight: FontWeight.w600,
                      color: isHover ? AppColors.white : AppColors.gray800,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "Ref: ${selected.registration.index} ${selected.customer.mobileNo.isNullOrEmpty ? '' : '| ${selected.customer.mobileNo}'}",
                    style: AppStyles.body.copyWith(
                      color: isHover ? AppColors.white : AppColors.gray600,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  if (!selected.customer.email.isNullOrEmpty) ...[
                    const SizedBox(height: 1),
                    Text(
                      selected.customer.email!,
                      style: AppStyles.body.copyWith(
                        color: isHover ? AppColors.white : AppColors.gray600,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ],
              ),
            ),
          );
  }
}
