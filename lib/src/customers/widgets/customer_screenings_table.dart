import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hop_pos/app/app_colors.dart';
import 'package:hop_pos/app/app_styles.dart';
import 'package:hop_pos/src/customers/models/customer_screenings_datasource.dart';
import 'package:hop_pos/src/customers/models/customer_with_registration.dart';

class CustomerScreeningsTable extends ConsumerWidget {
  const CustomerScreeningsTable({super.key, required this.registrations});
  final List<CustomerWithRegistration> registrations;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final source = ref.watch(customerScreeningsDataSourceProvider(registrations));

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Column(
        children: [
          Container(
            constraints: const BoxConstraints(maxHeight: 400),
            child: PaginatedDataTable2(
              headingRowColor: MaterialStateColor.resolveWith((states) => AppColors.brand600),
              headingTextStyle: AppStyles.bodyLarge.copyWith(
                color: AppColors.white,
                fontWeight: FontWeight.bold,
              ),
              dataTextStyle: AppStyles.body,
              border: TableBorder.all(color: AppColors.gray200),
              columnSpacing: 12,
              horizontalMargin: 12,
              dataRowHeight: 53,
              renderEmptyRowsInTheEnd: false,
              minWidth: 600,
              rowsPerPage: 5,
              empty: Container(
                padding: const EdgeInsets.all(15),
                child: Center(
                  child: Text(
                    'No record found',
                    style: AppStyles.body,
                  ),
                ),
              ),
              columns: const [
                DataColumn2(
                  label: Text(
                    'Screening',
                  ),
                ),
                DataColumn2(
                  label: Text(
                    'DateTime',
                  ),
                  fixedWidth: 190,
                ),
                DataColumn2(
                  label: Center(
                    child: Text(
                      'STF',
                    ),
                  ),
                  fixedWidth: 60,
                ),
                DataColumn2(
                  label: Center(
                    child: Text(
                      'UTF',
                    ),
                  ),
                  fixedWidth: 60,
                ),
                DataColumn2(
                  label: Center(
                    child: Text(
                      'Status',
                    ),
                  ),
                  fixedWidth: 120,
                ),
                DataColumn2(
                  label: Center(
                    child: Text(
                      'Synced',
                    ),
                  ),
                  fixedWidth: 70,
                ),
              ],
              source: source,
            ),
          ),
        ],
      ),
    );
  }
}
