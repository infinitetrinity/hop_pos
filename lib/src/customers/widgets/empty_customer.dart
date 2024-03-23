import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hop_pos/app/app_colors.dart';
import 'package:hop_pos/app/app_styles.dart';
import 'package:hop_pos/src/pos/controllers/pos_controller.dart';

class EmptyCustomer extends ConsumerWidget {
  const EmptyCustomer({super.key, required this.isHover});
  final bool isHover;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final customersCount = ref.watch(posControllerProvider.notifier).getCustomersCount();

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Select Customer',
              style: AppStyles.bodyLarge.copyWith(
                fontWeight: FontWeight.w600,
                color: isHover ? AppColors.white : AppColors.gray800,
              ),
            ),
            FutureBuilder<int?>(
              future: customersCount,
              builder: (_, snapshot) {
                return snapshot.data == null
                    ? SizedBox(
                        child: Text(snapshot.error.toString()),
                      )
                    : Column(
                        children: [
                          const SizedBox(height: 2),
                          Text(
                            "${snapshot.data} customers",
                            style: AppStyles.body.copyWith(
                              color: isHover ? AppColors.white : AppColors.gray500,
                            ),
                          ),
                        ],
                      );
              },
            ),
            const SizedBox(height: 2),
            Text(
              'Click here to select customer',
              style: AppStyles.bodySmall.copyWith(
                color: isHover ? AppColors.white : AppColors.gray600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
