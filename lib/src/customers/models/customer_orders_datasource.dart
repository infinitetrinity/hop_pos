import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hop_pos/app/app_colors.dart';
import 'package:hop_pos/app/app_extension.dart';
import 'package:hop_pos/app/app_routes.dart';
import 'package:hop_pos/routes/pos_routes.dart';
import 'package:hop_pos/src/orders/models/order_with_customer_and_payment.dart';
import 'package:hop_pos/src/pos/controllers/pos_controller.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'customer_orders_datasource.g.dart';

@riverpod
Raw<CustomerOrdersDataSource> customerOrdersDataSource(
    CustomerOrdersDataSourceRef ref, List<OrderWithCustomerAndPayment> orders) {
  return CustomerOrdersDataSource(
    orders: orders,
    posController: ref.watch(posControllerProvider.notifier),
    goRouter: ref.watch(goRouterProvider),
  );
}

class CustomerOrdersDataSource extends DataTableSource {
  List<OrderWithCustomerAndPayment> orders;
  final PosController posController;
  final GoRouter goRouter;

  CustomerOrdersDataSource({
    required this.orders,
    required this.posController,
    required this.goRouter,
  });

  @override
  DataRow2 getRow(int index) {
    final item = orders[index];
    bool isStriped = index % 2 != 0;

    return DataRow2.byIndex(
      index: index,
      color: MaterialStateProperty.resolveWith<Color?>((states) {
        return states.contains(MaterialState.hovered)
            ? const Color.fromARGB(255, 33, 40, 53)
            : (isStriped ? AppColors.gray100.withOpacity(0.8) : AppColors.white.withOpacity(0.8));
      }),
      onTap: () async {
        await posController.setPosOrderWithCustomerAndPayment(item);
        goRouter.go(PosRoute().location);
      },
      cells: [
        DataCell(
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 0),
            child: Text(
              item.screening.name,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
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
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => orders.length;

  @override
  int get selectedRowCount => 0;
}
