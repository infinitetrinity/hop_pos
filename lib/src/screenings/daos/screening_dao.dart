import 'package:drift/drift.dart';
import 'package:hop_pos/app/app_db.dart';
import 'package:hop_pos/app/app_extension.dart';
import 'package:hop_pos/src/order_payments/models/new_order_payments_table.dart';
import 'package:hop_pos/src/order_payments/models/order_payments_table.dart';
import 'package:hop_pos/src/orders/models/new_orders_table.dart';
import 'package:hop_pos/src/orders/models/orders_table.dart';
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

  Future<List<ScreeningWithSalesData>> getSalesData(List<Screening> screenings) async {
    final screeningIds = screenings.map((screening) => screening.id);
    final ordersCount = ordersTable.id.count(distinct: true);
    final ordersTotal = ordersTable.netTotal.total() + ordersTable.rounding.total();
    final ordersPaymentTotal = orderPaymentsTable.amount.total() + newOrderPaymentsTable.amount.total();
    final ordersStfCount = ordersTable.isStf.count(filter: ordersTable.isStf.equals(true));
    final ordersUtfCount = ordersTable.isUtf.count(filter: ordersTable.isStf.equals(true));
    final ordersLastSalesAt = ordersTable.createdAt.max();

    final newOrdersCount = newOrdersTable.id.count(distinct: true);
    final newOrdersTotal = newOrdersTable.netTotal.total() + newOrdersTable.rounding.total();
    final newOrdersPaymentTotal = newOrderPaymentsTable.amount.total();
    final newOrdersStfCount = newOrdersTable.isStf.count(filter: newOrdersTable.isStf.equals(true));
    final newOrdersUtfCount = newOrdersTable.isUtf.count(filter: newOrdersTable.isUtf.equals(true));
    final newOrdersLastSalesAt = newOrdersTable.createdAt.max();

    final ordersQuery = Subquery(
      select(ordersTable).join([
        leftOuterJoin(
          orderPaymentsTable,
          orderPaymentsTable.orderId.equalsExp(ordersTable.id),
          useColumns: false,
        ),
        leftOuterJoin(
          newOrderPaymentsTable,
          newOrderPaymentsTable.orderId.equalsExp(
                ordersTable.id,
              ) &
              newOrderPaymentsTable.orderIsNew.equals(false),
          useColumns: false,
        ),
      ])
        ..addColumns([
          ordersCount,
          ordersTotal,
          ordersPaymentTotal,
          ordersStfCount,
          ordersUtfCount,
          ordersLastSalesAt,
        ])
        ..where(ordersTable.screeningId.isIn(screeningIds))
        ..groupBy([ordersTable.screeningId]),
      'orders',
    );

    final newOrdersQuery = Subquery(
      select(newOrdersTable).join([
        leftOuterJoin(
          newOrderPaymentsTable,
          newOrderPaymentsTable.orderId.equalsExp(
                newOrdersTable.id,
              ) &
              newOrderPaymentsTable.orderIsNew.equals(true),
          useColumns: false,
        ),
      ])
        ..addColumns([
          newOrdersCount,
          newOrdersTotal,
          newOrdersPaymentTotal,
          newOrdersStfCount,
          newOrdersUtfCount,
          newOrdersLastSalesAt,
        ])
        ..where(newOrdersTable.screeningId.isIn(screeningIds))
        ..groupBy([newOrdersTable.screeningId]),
      'new_orders',
    );

    final totalCount = coalesce([ordersQuery.ref(ordersCount), const Constant(0)]) +
        coalesce([newOrdersQuery.ref(newOrdersCount), const Constant(0)]);
    final total = coalesce([ordersQuery.ref(ordersTotal), const Constant(0.0)]) +
        coalesce([newOrdersQuery.ref(newOrdersTotal), const Constant(0.0)]);
    final paymentTotal = coalesce([ordersQuery.ref(ordersPaymentTotal), const Constant(0.0)]) +
        coalesce([newOrdersQuery.ref(newOrdersPaymentTotal), const Constant(0.0)]);
    final stfCount = coalesce([ordersQuery.ref(ordersStfCount), const Constant(0)]) +
        coalesce([newOrdersQuery.ref(newOrdersStfCount), const Constant(0)]);
    final utfCount = coalesce([ordersQuery.ref(ordersUtfCount), const Constant(0)]) +
        coalesce([newOrdersQuery.ref(newOrdersUtfCount), const Constant(0)]);
    final lastSalesAt = coalesce([newOrdersQuery.ref(newOrdersLastSalesAt), ordersQuery.ref(ordersLastSalesAt)]);

    final query = select(screeningsTable).join([
      leftOuterJoin(
        ordersQuery,
        ordersQuery.ref(ordersTable.screeningId).equalsExp(screeningsTable.id),
      ),
      leftOuterJoin(
        newOrdersQuery,
        newOrdersQuery.ref(newOrdersTable.screeningId).equalsExp(screeningsTable.id),
      ),
    ])
      ..addColumns([
        totalCount,
        total,
        paymentTotal,
        stfCount,
        utfCount,
        lastSalesAt,
      ])
      ..orderBy([OrderingTerm.desc(lastSalesAt)])
      ..where(screeningsTable.id.isIn(screeningIds));

    return (await query.get()).map((row) {
      return ScreeningWithSalesData(
        screening: row.readTable(screeningsTable),
        salesCount: row.read(totalCount) ?? 0,
        salesTotal: row.read(total) ?? 0,
        paymentTotal: row.read(paymentTotal) ?? 0,
        stfCount: row.read(stfCount) ?? 0,
        utfCount: row.read(utfCount) ?? 0,
        lastSalesAt: row.read(lastSalesAt)!,
      );
    }).toList();
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
}
