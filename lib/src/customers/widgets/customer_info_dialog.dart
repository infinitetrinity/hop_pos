import 'package:flutter/material.dart';
import 'package:hop_pos/app/app_colors.dart';
import 'package:hop_pos/app/app_styles.dart';
import 'package:hop_pos/src/common/widgets/dialog_title.dart';
import 'package:hop_pos/src/customers/models/customer_with_screenings_and_orders.dart';
import 'package:hop_pos/src/customers/widgets/customer_detail_dialog.dart';
import 'package:hop_pos/src/customers/widgets/customer_screenings_table.dart';

class CustomerInfoDialog extends StatelessWidget {
  const CustomerInfoDialog({super.key, required this.customer});
  final CustomerWithScreeningsAndOrders customer;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: IntrinsicHeight(
        child: Container(
          color: AppColors.white,
          width: 1000,
          child: Column(
            children: [
              const DialogTitle(title: 'Customer Detail'),
              Material(
                child: DefaultTabController(
                  length: 3,
                  child: Column(
                    children: [
                      TabBar(
                        indicatorColor: AppColors.brand600,
                        labelStyle: AppStyles.body.copyWith(
                          color: AppColors.gray800,
                          fontWeight: FontWeight.bold,
                        ),
                        unselectedLabelStyle: AppStyles.body.copyWith(
                          color: AppColors.gray600,
                        ),
                        tabs: const [
                          Tab(icon: Text('Customer')),
                          Tab(icon: Text('Screening')),
                          Tab(icon: Text('Sales')),
                        ],
                      ),
                      SizedBox(
                        height: 700,
                        child: TabBarView(
                          children: [
                            CustomerDetailDialog(
                              customer: customer.customer,
                              haveScreening: customer.screenings?.isNotEmpty == true,
                            ),
                            CustomerScreeningsTable(
                              registrations: customer.screenings ?? [],
                            ),
                            Container(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
