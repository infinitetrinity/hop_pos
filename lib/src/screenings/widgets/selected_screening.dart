import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hop_pos/app/app_assets.dart';
import 'package:hop_pos/app/app_colors.dart';
import 'package:hop_pos/app/app_styles.dart';
import 'package:hop_pos/routes/pos_routes.dart';
import 'package:hop_pos/src/pos/controllers/pos_controller.dart';
import 'package:hop_pos/src/screenings/widgets/selected_screening_detail.dart';

class SelectedScreening extends ConsumerWidget {
  const SelectedScreening({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screening = ref.watch(posControllerProvider.select((prov) => prov.screening));

    return Container(
      height: screening == null ? 330 : 782,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      color: AppColors.white,
      width: double.infinity,
      child: Column(
        children: [
          Image.asset(
            AppAssets.screeningsIcon,
            fit: BoxFit.cover,
            width: 120,
          ),
          const SizedBox(height: 15),
          if (screening == null) ...[
            Text(
              'Select a screening to begin POS',
              style: AppStyles.body,
            ),
            const SizedBox(height: 10),
          ],
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                border: screening == null
                    ? const Border(
                        top: BorderSide(width: 1, color: AppColors.gray300),
                        bottom: BorderSide(width: 1, color: AppColors.gray300),
                      )
                    : null,
              ),
              child: const SelectedScreeningDetail(),
            ),
          ),
          const SizedBox(height: 15),
          ElevatedButton(
            onPressed: screening == null ? null : () => PosRoute().push(context),
            style: ElevatedButton.styleFrom(
              shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
              padding: const EdgeInsets.all(25),
              backgroundColor: AppColors.brand600,
              disabledBackgroundColor: AppColors.gray600,
              minimumSize: const Size(double.infinity, 40),
              disabledMouseCursor: SystemMouseCursors.forbidden,
            ),
            child: Text(
              screening == null ? 'Select a screening' : 'Begin POS',
              style: AppStyles.body.copyWith(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
