import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hop_pos/app/app_colors.dart';
import 'package:hop_pos/app/app_styles.dart';
import 'package:hop_pos/src/orders/models/screenings_sales_datasource.dart';
import 'package:hop_pos/src/orders/states/screening_sales_search_state.dart';

class ScreeningsSalesTable extends ConsumerWidget {
  const ScreeningsSalesTable({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final source = ref.watch(screeningsSalesDataSourceProvider);
    final PaginatorController controller = PaginatorController();

    ref.listen(screeningSalesSearchStateProvider, (_, current) {
      controller.goToFirstPage();
    });

    return Column(
      children: [
        Container(
          constraints: const BoxConstraints(maxHeight: 650),
          child: AsyncPaginatedDataTable2(
            controller: controller,
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
        ),
      ],
    );
  }
}
