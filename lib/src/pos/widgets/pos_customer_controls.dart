import 'package:flutter/material.dart';
import 'package:hop_pos/app/app_colors.dart';
import 'package:hop_pos/app/app_styles.dart';
import 'package:hop_pos/src/customers/widgets/customer_search_input.dart';
import 'package:hop_pos/src/customers/widgets/walk_in_customer_dialog.dart';

class PosCustomerControls extends StatelessWidget {
  const PosCustomerControls({super.key, this.width, this.onClicked});
  final double? width;
  final void Function()? onClicked;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.topStart,
      child: Container(
        width: width ?? 400,
        height: 140,
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        decoration: const BoxDecoration(
          color: AppColors.white,
          border: Border(
            top: BorderSide(color: AppColors.gray300),
          ),
        ),
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (onClicked != null) {
                    onClicked!();
                  }

                  showDialog(
                    context: context,
                    builder: (_) => const WalkInCustomerDialog(),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(20),
                  backgroundColor: AppColors.green700,
                  shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(3))),
                ),
                child: Text(
                  'Walk-in Customer',
                  style: AppStyles.bodyLarge.copyWith(
                    color: AppColors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15),
            const CustomerSearchInput(),
          ],
        ),
      ),
    );
  }
}
