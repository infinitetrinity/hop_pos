import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hop_pos/app/app_colors.dart';
import 'package:hop_pos/app/app_styles.dart';
import 'package:hop_pos/src/orders/models/incomplete_sales_datasource.dart';

class IncompleteSalesTable extends ConsumerWidget {
  const IncompleteSalesTable({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final source = ref.watch(incompleteSalesDataSourceProvider);

    return Column(
      children: [
        Container(
          constraints: const BoxConstraints(maxHeight: 650),
          child: AsyncPaginatedDataTable2(
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
            source: source,
            rowsPerPage: 10,
            errorBuilder: (error) => Container(
              padding: const EdgeInsets.all(15),
              child: Center(
                child: Text(
                  error.toString(),
                  style: AppStyles.body,
                ),
              ),
            ),
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
                  'Invoice',
                ),
                fixedWidth: 120,
              ),
              DataColumn2(
                label: Text(
                  'Customer',
                ),
                fixedWidth: 180,
              ),
              DataColumn2(
                label: Text(
                  'REF',
                ),
                fixedWidth: 70,
              ),
              DataColumn2(
                label: Text(
                  'Total',
                ),
                numeric: true,
                fixedWidth: 100,
              ),
              DataColumn2(
                label: Text(
                  'Balance',
                ),
                numeric: true,
                fixedWidth: 100,
              ),
              DataColumn2(
                label: Center(
                  child: Text(
                    'STF',
                  ),
                ),
                fixedWidth: 70,
              ),
              DataColumn2(
                label: Center(
                  child: Text(
                    'UTF',
                  ),
                ),
                fixedWidth: 70,
              ),
              DataColumn2(
                label: Center(
                  child: Text(
                    'Synced',
                  ),
                ),
                fixedWidth: 70,
              ),
              DataColumn2(
                label: Text(
                  'Created At',
                ),
                fixedWidth: 170,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
