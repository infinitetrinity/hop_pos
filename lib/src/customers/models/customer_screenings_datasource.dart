import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hop_pos/app/app_colors.dart';
import 'package:hop_pos/app/app_routes.dart';
import 'package:hop_pos/routes/pos_routes.dart';
import 'package:hop_pos/src/common/widgets/custom_badge.dart';
import 'package:hop_pos/src/customers/models/customer_with_registration.dart';
import 'package:hop_pos/src/pos/controllers/pos_controller.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'customer_screenings_datasource.g.dart';

@riverpod
Raw<CustomerScreeningsDataSource> customerScreeningsDataSource(
    CustomerScreeningsDataSourceRef ref, List<CustomerWithRegistration> registrations) {
  return CustomerScreeningsDataSource(
    registrations: registrations,
    posController: ref.watch(posControllerProvider.notifier),
    goRouter: ref.watch(goRouterProvider),
  );
}

class CustomerScreeningsDataSource extends DataTableSource {
  List<CustomerWithRegistration> registrations;
  final PosController posController;
  final GoRouter goRouter;

  CustomerScreeningsDataSource({
    required this.registrations,
    required this.posController,
    required this.goRouter,
  });

  @override
  DataRow2 getRow(int index) {
    final item = registrations[index];
    bool isStriped = index % 2 != 0;
    final isStf = (item.order?.order.isStf ?? false);
    final isUtf = (item.order?.order.isUtf ?? false);

    return DataRow2.byIndex(
      index: index,
      color: MaterialStateProperty.resolveWith<Color?>((states) {
        return states.contains(MaterialState.hovered)
            ? const Color.fromARGB(255, 33, 40, 53)
            : (isStriped ? AppColors.gray100.withOpacity(0.8) : AppColors.white.withOpacity(0.8));
      }),
      onTap: () async {
        await posController.setState(
          screening: item.screening,
          registration: item.registration,
          customer: item.customer,
          order: item.order,
        );
        goRouter.go(PosRoute().location);
      },
      cells: [
        DataCell(
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.screening.name,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ),
        DataCell(
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              item.timeslot?.displayDateTime ?? '',
            ),
          ),
        ),
        DataCell(
          Center(
            child: Icon(
              isStf ? Icons.check_circle : Icons.cancel,
              color: isStf ? AppColors.green600 : AppColors.red600,
            ),
          ),
        ),
        DataCell(
          Center(
            child: Icon(
              isUtf ? Icons.check_circle : Icons.cancel,
              color: isUtf ? AppColors.green600 : AppColors.red600,
            ),
          ),
        ),
        DataCell(
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: CustomBadge(
              text: item.status,
              bgColor: item.statusColor,
            ),
          ),
        ),
        DataCell(
          Center(
            child: Icon(
              item.registration.isNew ? Icons.cancel : Icons.check_circle,
              color: item.registration.isNew ? AppColors.red600 : AppColors.green600,
            ),
          ),
        ),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => registrations.length;

  @override
  int get selectedRowCount => 0;
}
