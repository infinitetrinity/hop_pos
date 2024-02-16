import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hop_pos/app/app_colors.dart';
import 'package:hop_pos/app/app_extension.dart';
import 'package:hop_pos/app/app_styles.dart';
import 'package:hop_pos/src/customers/widgets/customer_badges.dart';
import 'package:hop_pos/src/pos/controllers/pos_controller.dart';
import 'package:hop_pos/src/pos/widgets/pos_stf.dart';
import 'package:hop_pos/src/pos/widgets/pos_utf.dart';
import 'package:hop_pos/src/screening_registrations/widgets/screening_registration_badges.dart';

class PosCompletedCustomer extends ConsumerWidget {
  const PosCompletedCustomer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final customer = ref.watch(posControllerProvider.select((prov) => prov.customer));
    final registration = ref.watch(posControllerProvider.select((prov) => prov.registration));

    return customer == null
        ? Container()
        : Container(
            width: 500,
            decoration: BoxDecoration(
              border: Border.all(
                color: AppColors.gray300,
              ),
            ),
            padding: const EdgeInsets.all(15),
            child: Row(
              children: [
                const Padding(
                  padding: EdgeInsets.only(right: 12),
                  child: Icon(
                    Icons.account_circle_rounded,
                    color: AppColors.gray800,
                    size: 28,
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${customer.fullName} ${customer.nric.isNullOrEmpty ? '' : '(${customer.nric})'}",
                        style: AppStyles.bodyLarge.copyWith(
                          fontWeight: FontWeight.w600,
                          color: AppColors.gray800,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 5),
                      Text(
                        "Ref: ${registration?.index ?? customer.nricIndex} ${customer.mobileNo.isNullOrEmpty ? '' : '| ${customer.mobileNo}'}",
                        style: AppStyles.body.copyWith(
                          color: AppColors.gray600,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      if (!customer.email.isNullOrEmpty) ...[
                        const SizedBox(height: 1),
                        Text(
                          customer.email!,
                          style: AppStyles.body.copyWith(
                            color: AppColors.gray600,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                      Column(
                        children: [
                          const SizedBox(height: 5),
                          Row(
                            children: [
                              CustomerBadges(customer: customer),
                              ScreeningRegistrationBadges(
                                registration: registration,
                                hideSales: true,
                              ),
                              const PosUTF(
                                canRemove: false,
                                padding: EdgeInsets.only(right: 8),
                              ),
                              const PosSTF(
                                canRemove: false,
                                padding: EdgeInsets.only(right: 8),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
  }
}
