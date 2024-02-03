import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hop_pos/app/app_colors.dart';
import 'package:hop_pos/app/app_styles.dart';
import 'package:hop_pos/src/pos/controllers/pos_controller.dart';
import 'package:hop_pos/src/pos_licenses/states/pos_license_state.dart';

class PosInvoice extends ConsumerWidget {
  const PosInvoice({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final order = ref.watch(posControllerProvider.select((prov) => prov.order));
    final posLicense = ref.watch(posLicenseStateProvider).asData?.value;

    return order == null || order.order.id == null
        ? Container()
        : Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            decoration: const BoxDecoration(
              color: AppColors.white,
              border: Border(
                bottom: BorderSide(color: AppColors.gray300),
              ),
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.monetization_on,
                  color: AppColors.gray800,
                  size: 28,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Invoice no.:${order.order.displayInvoiceNo}",
                        style: AppStyles.bodyLarge.copyWith(
                          color: AppColors.gray800,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      if (posLicense?.id != order.order.licenseId)
                        Text(
                          "This order is created by another POS",
                          style: AppStyles.body.copyWith(
                            color: AppColors.red600,
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          );
  }
}
