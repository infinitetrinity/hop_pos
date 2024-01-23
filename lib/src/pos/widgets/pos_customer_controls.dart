import 'package:flutter/material.dart';
import 'package:hop_pos/app/app_colors.dart';
import 'package:hop_pos/app/app_styles.dart';
import 'package:hop_pos/src/customers/widgets/customer_search_input.dart';

class PosCustomerControls extends StatelessWidget {
  const PosCustomerControls({super.key, this.width});
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.topStart,
      child: Container(
        width: width ?? 400,
        height: 136,
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
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 18),
                  backgroundColor: AppColors.green700,
                  shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(3))),
                ),
                child: Text(
                  'Walk-in Customer',
                  style: AppStyles.body.copyWith(
                    color: AppColors.white,
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
