import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hop_pos/app/app_colors.dart';
import 'package:hop_pos/app/app_extension.dart';
import 'package:hop_pos/app/app_routes.dart';
import 'package:hop_pos/app/app_styles.dart';
import 'package:hop_pos/routes/order_routes.dart';
import 'package:hop_pos/src/orders/states/screening_sales_search_state.dart';
import 'package:hop_pos/src/screenings/actions/screening_actions.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'screenings_sales_datasource.g.dart';

@riverpod
Raw<ScreeningsSalesDataSource> screeningsSalesDataSource(ScreeningsSalesDataSourceRef ref) {
  return ScreeningsSalesDataSource(
    screeningActions: ref.watch(screeningActionsProvider),
    search: ref.watch(screeningSalesSearchStateProvider),
    goRouter: ref.watch(goRouterProvider),
  );
}

class ScreeningsSalesDataSource extends AsyncDataTableSource {
  final ScreeningActions screeningActions;
  final String? search;
  final GoRouter goRouter;

  ScreeningsSalesDataSource({required this.screeningActions, required this.search, required this.goRouter});

  @override
  Future<AsyncRowsResponse> getRows(int startIndex, int count) async {
    final int page = startIndex >= count ? (startIndex / count).round() + 1 : 1;
    final data = await screeningActions.getHaveSalesWithinDays(page: page, size: count, search: search);
    final total = await screeningActions.getHaveSalesWithinDaysCount(search: search);

    return AsyncRowsResponse(
      total,
      data.map((item) {
        bool isStriped = data.indexOf(item) % 2 != 0;

        return DataRow2(
          onTap: () {
            goRouter.go(ScreeningOrdersRoute($extra: item.screening).location, extra: item.screening);
          },
          key: ValueKey(item.screening.id),
          color: MaterialStateProperty.resolveWith<Color?>((states) {
            return states.contains(MaterialState.hovered)
                ? AppColors.blue600
                : (isStriped ? AppColors.gray100.withOpacity(0.8) : AppColors.white.withOpacity(0.8));
          }),
          cells: [
            DataCell(
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 0),
                child: SizedBox(
                  width: 700,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.screening.name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      if (!item.screening.corporate.isNullOrEmpty) ...[
                        const SizedBox(height: 3),
                        Text(
                          item.screening.corporate ?? '',
                          style: AppStyles.bodySmall.copyWith(color: AppColors.gray600),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ]
                    ],
                  ),
                ),
              ),
            ),
            DataCell(
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  item.salesCount.toString(),
                ),
              ),
            ),
            DataCell(
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  item.salesTotal.formatMoney,
                ),
              ),
            ),
            DataCell(
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  item.paymentTotal.formatMoney,
                ),
              ),
            ),
            DataCell(
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  "${item.stfCount}/${item.utfCount}",
                ),
              ),
            ),
            DataCell(
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  item.displayLastSalesAt,
                ),
              ),
            ),
          ],
        );
      }).toList(),
    );
  }
}
