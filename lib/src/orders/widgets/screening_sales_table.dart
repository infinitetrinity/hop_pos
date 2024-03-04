import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hop_pos/app/app_colors.dart';
import 'package:hop_pos/app/app_styles.dart';
import 'package:hop_pos/src/orders/models/screening_sales_datasource.dart';

class ScreeningSalesTable extends ConsumerStatefulWidget {
  const ScreeningSalesTable({super.key});

  @override
  ConsumerState<ScreeningSalesTable> createState() => _ScreeningSalesTableState();
}

class _ScreeningSalesTableState extends ConsumerState<ScreeningSalesTable> {
  @override
  Widget build(BuildContext context) {
    final source = ref.watch(screeningSalesDataSourceProvider);

    return Container(
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
        columns: const [
          DataColumn2(
            label: Text(
              'Screening',
            ),
          ),
          DataColumn2(
            label: Text(
              'Sales',
            ),
            numeric: true,
            fixedWidth: 70,
          ),
          DataColumn2(
            label: Text(
              'Total',
            ),
            numeric: true,
            fixedWidth: 120,
          ),
          DataColumn2(
            label: Text(
              'Payments',
            ),
            numeric: true,
            fixedWidth: 120,
          ),
          DataColumn2(
            label: Text(
              'STF/UTF',
            ),
            numeric: true,
            fixedWidth: 90,
          ),
          DataColumn2(
            label: Text(
              'Last Sales',
            ),
            fixedWidth: 170,
          ),
        ],
      ),
    );
  }
}
