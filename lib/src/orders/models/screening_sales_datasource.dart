import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hop_pos/app/app_colors.dart';
import 'package:hop_pos/app/app_extension.dart';
import 'package:hop_pos/app/app_routes.dart';
import 'package:hop_pos/routes/pos_routes.dart';
import 'package:hop_pos/src/orders/states/screening_sales_search_state.dart';
import 'package:hop_pos/src/pos/controllers/pos_controller.dart';
import 'package:hop_pos/src/screenings/actions/screening_actions.dart';
import 'package:hop_pos/src/screenings/models/screening.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'screening_sales_datasource.g.dart';

@riverpod
Raw<ScreeningSalesDataSource> screeningSalesDataSource(ScreeningSalesDataSourceRef ref, Screening screening) {
  return ScreeningSalesDataSource(
    screening: screening,
    posController: ref.watch(posControllerProvider.notifier),
    screeningActions: ref.watch(screeningActionsProvider),
    search: ref.watch(screeningSalesSearchStateProvider),
    searchNotifier: ref.watch(screeningSalesSearchStateProvider.notifier),
    goRouter: ref.watch(goRouterProvider),
  );
}

class ScreeningSalesDataSource extends AsyncDataTableSource {
  final Screening screening;
  final PosController posController;
  final ScreeningActions screeningActions;
  final String? search;
  final ScreeningSalesSearchState searchNotifier;
  final GoRouter goRouter;

  ScreeningSalesDataSource({
    required this.screening,
    required this.posController,
    required this.screeningActions,
    required this.search,
    required this.searchNotifier,
    required this.goRouter,
  });

  @override
  Future<AsyncRowsResponse> getRows(int startIndex, int count) async {
    final int page = startIndex >= count ? (startIndex / count).round() + 1 : 1;
    final data = await screeningActions.getScreeningOrders(screening, page: page, size: count, search: search);
    final total = await screeningActions.getScreeningOrdersTotalCount(screening, search: search);

    return AsyncRowsResponse(
      total,
      data.map((item) {
        bool isStriped = data.indexOf(item) % 2 != 0;

        return DataRow2(
          onTap: () async {
            searchNotifier.set(null);
            await posController.setPosOrder(item);
            goRouter.go(PosRoute().location);
          },
          key: ValueKey("${item.order.id}-${item.order.displayInvoiceNo}"),
          color: MaterialStateProperty.resolveWith<Color?>((states) {
            return states.contains(MaterialState.hovered)
                ? const Color.fromARGB(255, 33, 40, 53)
                : (isStriped ? AppColors.gray100.withOpacity(0.8) : AppColors.white.withOpacity(0.8));
          }),
          cells: [
            DataCell(
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 0),
                child: Text(
                  item.order.displayInvoiceNo,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            DataCell(
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  item.customer.fullName,
                ),
              ),
            ),
            DataCell(
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  (item.index ?? item.customer.nricIndex) ?? '',
                ),
              ),
            ),
            DataCell(
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  item.order.total.formatMoney,
                ),
              ),
            ),
            DataCell(
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  (item.totalPayment ?? 0).formatMoney,
                ),
              ),
            ),
            DataCell(
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  item.change.formatMoney,
                ),
              ),
            ),
            DataCell(
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  item.balance.formatMoney,
                ),
              ),
            ),
            DataCell(
              Center(
                child: Icon(
                  (item.order.isStf ?? false) ? Icons.check_circle : Icons.cancel,
                  color: (item.order.isStf ?? false) ? AppColors.green600 : AppColors.red600,
                ),
              ),
            ),
            DataCell(
              Center(
                child: Icon(
                  (item.order.isUtf ?? false) ? Icons.check_circle : Icons.cancel,
                  color: (item.order.isUtf ?? false) ? AppColors.green600 : AppColors.red600,
                ),
              ),
            ),
            DataCell(
              Center(
                child: Icon(
                  item.order.isNew ? Icons.cancel : Icons.check_circle,
                  color: item.order.isNew ? AppColors.red600 : AppColors.green600,
                ),
              ),
            ),
            DataCell(
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(item.order.displayCreatedAt ?? ''),
              ),
            ),
          ],
        );
      }).toList(),
    );
  }
}
