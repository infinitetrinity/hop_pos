import 'package:drift/drift.dart';
import 'package:hop_pos/app/app_db.dart';
import 'package:hop_pos/app/app_extension.dart';
import 'package:hop_pos/src/customers/models/new_customers_table.dart';
import 'package:hop_pos/src/order_payments/models/new_order_payments_table.dart';
import 'package:hop_pos/src/order_payments/models/order_payments_table.dart';
import 'package:hop_pos/src/orders/models/new_orders_table.dart';
import 'package:hop_pos/src/orders/models/order_with_customer_and_payment.dart';
import 'package:hop_pos/src/orders/models/orders_table.dart';
import 'package:hop_pos/src/screening_registrations/models/screening_registrations_table.dart';
import 'package:hop_pos/src/screening_timeslots/models/screening_timeslots_table.dart';
import 'package:hop_pos/src/screenings/models/screening.dart';
import 'package:hop_pos/src/screenings/models/screening_with_sales_data.dart';
import 'package:hop_pos/src/screenings/models/screenings_table.dart';

part 'screening_dao.g.dart';

@DriftAccessor(tables: [
  ScreeningsTable,
  ScreeningTimeslotsTable,
  OrdersTable,
  NewOrdersTable,
  OrderPaymentsTable,
  NewOrderPaymentsTable,
  NewCustomersTable,
  ScreeningRegistrationsTable,
])
class ScreeningDao extends DatabaseAccessor<AppDb> with _$ScreeningDaoMixin {
  ScreeningDao(AppDb db) : super(db);

  Future<List<Screening>> getUpcoming({int days = 7}) async {
    final query = select(screeningsTable).join(
      [
        innerJoin(
          screeningTimeslotsTable,
          screeningTimeslotsTable.screeningId.equalsExp(
            screeningsTable.id,
          ),
          useColumns: false,
        ),
      ],
    );

    query.where(screeningTimeslotsTable.dateAndTime.isBetweenValues(
      DateTime.now(),
      DateTime.now().add(Duration(days: days)),
    ));
    query.orderBy([OrderingTerm.asc(screeningTimeslotsTable.dateAndTime)]);
    query.groupBy([screeningsTable.id]);
    query.limit(60);

    return (await query.get()).map((row) => row.readTable(screeningsTable)).toList();
  }

  Future<List<Screening>> getWithOrdersWithinDays(int days, {int page = 1, int size = 20, String? search}) async {
    final query = select(screeningsTable).join(
      [
        leftOuterJoin(
          ordersTable,
          ordersTable.screeningId.equalsExp(
            screeningsTable.id,
          ),
          useColumns: false,
        ),
        leftOuterJoin(
          newOrdersTable,
          newOrdersTable.screeningId.equalsExp(
            screeningsTable.id,
          ),
          useColumns: false,
        ),
      ],
    )
      ..where(ordersTable.createdAt.isBetweenValues(
            DateTime.now().subtract(Duration(days: days)),
            DateTime.now(),
          ) |
          newOrdersTable.createdAt.isBetweenValues(
            DateTime.now().subtract(Duration(days: days)),
            DateTime.now(),
          ))
      ..groupBy([screeningsTable.id]);

    if (!search.isNullOrEmpty) {
      query.where(screeningsTable.name.like("%$search%") | screeningsTable.corporate.like("%$search%"));
    }

    final orderLastSalesAt = ordersTable.createdAt.max();
    final newOrdersLastSalesAt = newOrdersTable.createdAt.max();
    query.addColumns([orderLastSalesAt, newOrdersLastSalesAt]);
    query.orderBy([OrderingTerm.desc(newOrdersLastSalesAt), OrderingTerm.desc(orderLastSalesAt)]);

    if (page > 0) {
      query.limit(size, offset: ((page - 1) * size));
    }

    return (await query.get()).map((row) => row.readTable(screeningsTable)).toList();
  }

  Future<List<ScreeningWithSalesData>> getScreeningsSalesData(List<Screening> screenings) async {
    final orders = await db.orderDao.getScreeningOrdersData(screenings);
    final newOrders = await db.newOrderDao.getScreeningOrdersData(screenings);

    final Map<int, ScreeningWithSalesData> results = {};
    for (final order in [...orders, ...newOrders]) {
      final screeningId = order.screening.id;

      if (!results.containsKey(screeningId)) {
        results[screeningId] = order;
        continue;
      }

      final existOrder = results[screeningId]!;
      results[screeningId] = existOrder.copyWith(
        salesCount: existOrder.salesCount + order.salesCount,
        salesTotal: existOrder.salesTotal + order.salesTotal,
        paymentTotal: existOrder.paymentTotal + order.paymentTotal,
        stfCount: existOrder.stfCount + order.stfCount,
        utfCount: existOrder.utfCount + order.utfCount,
        lastSalesAt: existOrder.lastSalesAt.isAfter(order.lastSalesAt) ? existOrder.lastSalesAt : order.lastSalesAt,
      );
    }

    return results.values.toList()..sort((a, b) => b.lastSalesAt.compareTo(a.lastSalesAt));
  }

  Future<List<OrderWithCustomerAndPayment>> getScreeningOrders(
    Screening screening, {
    int page = 1,
    int size = 20,
    String? search,
  }) async {
    final orders = await db.orderDao.getScreeningOrders(screening, search: search);
    final newOrders = await db.newOrderDao.getScreeningOrders(screening, search: search);

    final sorted = [...orders, ...newOrders]..sort((a, b) {
        final intA = int.tryParse(a.index ?? '');
        final intB = int.tryParse(b.index ?? '');

        if (intA == null && intB == null) {
          return (a.index ?? '').compareTo(b.index ?? '');
        }
        if (intA == null) {
          return 1;
        }
        if (intB == null) {
          return -1;
        }

        return intA.compareTo(intB);
      });

    final start = size * (page - 1);
    final end = start + size > sorted.length ? sorted.length : start + size;
    return sorted.sublist(start, end).toList();
  }

  Future<int> getScreeningOrdersTotalCount(Screening screening, {String? search}) async {
    final orderCountExp = ordersTable.id.count();

    final orderQuery = selectOnly(ordersTable)
      ..addColumns([orderCountExp])
      ..where(ordersTable.screeningId.equals(screening.id));

    final newOrderCountExp = newOrdersTable.id.count();

    final newOrderQuery = selectOnly(newOrdersTable)
      ..addColumns([newOrderCountExp])
      ..where(newOrdersTable.screeningId.equals(screening.id));

    if (!search.isNullOrEmpty) {
      orderQuery.join(
        [
          leftOuterJoin(
            customersTable,
            customersTable.id.equalsExp(
              ordersTable.customerId,
            ),
            useColumns: false,
          ),
        ],
      ).where(ordersTable.invoiceNo.like("%$search%") |
          ordersTable.invoicePrefix.like("%$search%") |
          customersTable.fullName.like("%$search%") |
          customersTable.nric.like("%$search%"));

      newOrderQuery.join(
        [
          leftOuterJoin(
            customersTable,
            customersTable.nric.equalsExp(
              newOrdersTable.customerNric,
            ),
            useColumns: false,
          ),
          leftOuterJoin(
            newCustomersTable,
            newCustomersTable.nric.equalsExp(
              newOrdersTable.customerNric,
            ),
            useColumns: false,
          ),
        ],
      ).where(newOrdersTable.invoiceNo.like("%$search%") |
          newOrdersTable.invoicePrefix.like("%$search%") |
          customersTable.fullName.like("%$search%") |
          customersTable.nric.like("%$search%"));
    }

    final orderCount = (await orderQuery.getSingle()).read(orderCountExp) ?? 0;
    final newOrderCount = (await newOrderQuery.getSingle()).read(newOrderCountExp) ?? 0;
    return orderCount + newOrderCount;
  }

  Future<List<Screening>> search(String search) {
    final query = select(screeningsTable)..where((table) => table.name.like("%$search%"));
    query.orderBy([(table) => OrderingTerm.desc(table.id)]);
    query.limit(20);
    return query.get();
  }

  Future<Screening> insertScreening(ScreeningsTableCompanion screening) async {
    return await into(screeningsTable).insertReturning(screening);
  }

  Future<List<Screening>> insertScreenings(List<ScreeningsTableCompanion> screenings) async {
    return await transaction(() async {
      List<Future<Screening>> insertFutures = [];

      for (ScreeningsTableCompanion screening in screenings) {
        insertFutures.add(insertScreening(screening));
      }

      List<Screening> result = await Future.wait(insertFutures);
      return result;
    });
  }

  Future<Screening?> getById(int id) {
    final query = select(screeningsTable)..where((tbl) => tbl.id.equals(id));
    return query.getSingleOrNull();
  }
}
