import 'package:drift/drift.dart';
import 'package:hop_pos/app/app_db.dart';
import 'package:hop_pos/src/customers/models/customer.dart';
import 'package:hop_pos/src/customers/models/customer_with_registration.dart';
import 'package:hop_pos/src/customers/models/customers_table.dart';
import 'package:hop_pos/src/orders/models/new_orders_table.dart';
import 'package:hop_pos/src/orders/models/orders_table.dart';
import 'package:hop_pos/src/screening_registrations/models/screening_registration.dart';
import 'package:hop_pos/src/screening_registrations/models/screening_registrations_table.dart';
import 'package:hop_pos/src/screening_timeslots/models/screening_timeslots_table.dart';
import 'package:hop_pos/src/screenings/models/screening.dart';

part 'screening_registration_dao.g.dart';

@DriftAccessor(tables: [
  ScreeningRegistrationsTable,
  ScreeningTimeslotsTable,
  CustomersTable,
  OrdersTable,
  NewOrdersTable,
])
class ScreeningRegistrationDao extends DatabaseAccessor<AppDb> with _$ScreeningRegistrationDaoMixin {
  ScreeningRegistrationDao(AppDb db) : super(db);

  Future<ScreeningRegistration?> findByCustomerAndScreening(Customer customer, Screening screening) async {
    final query = select(screeningRegistrationsTable).join(
      [
        innerJoin(
          customersTable,
          customersTable.id.equalsExp(
            screeningRegistrationsTable.customerId,
          ),
        ),
        innerJoin(
          screeningTimeslotsTable,
          screeningTimeslotsTable.id.equalsExp(
            screeningRegistrationsTable.timeslotId,
          ),
          useColumns: false,
        ),
      ],
    );

    query.where(screeningRegistrationsTable.customerId.isValue(customer.id!));
    query.where(screeningTimeslotsTable.screeningId.isValue(screening.id));

    final index = coalesce([
      screeningRegistrationsTable.index,
      customersTable.nric.substr(-5, 5),
    ]);
    query.addColumns([index]);

    return (await query.get()).map((row) {
      return row.readTable(screeningRegistrationsTable).copyWith(index: row.read(index));
    }).firstOrNull;
  }

  Future<ScreeningRegistration> insertScreeningRegistration(ScreeningRegistrationsTableCompanion registration) async {
    return await into(screeningRegistrationsTable).insertReturning(registration);
  }

  Future<List<ScreeningRegistration>> insertScreeningRegistrations(
      List<ScreeningRegistrationsTableCompanion> registrations) async {
    return await transaction(() async {
      List<Future<ScreeningRegistration>> insertFutures = [];

      for (ScreeningRegistrationsTableCompanion registration in registrations) {
        insertFutures.add(insertScreeningRegistration(registration));
      }

      List<ScreeningRegistration> result = await Future.wait(insertFutures);
      return result;
    });
  }

  Future<int> getScreeningRegistrationsCount(Screening screening) async {
    final query = select(screeningRegistrationsTable).join(
      [
        innerJoin(
          screeningTimeslotsTable,
          screeningTimeslotsTable.id.equalsExp(
            screeningRegistrationsTable.timeslotId,
          ),
          useColumns: false,
        ),
      ],
    );

    query.where(screeningTimeslotsTable.screeningId.isValue(screening.id));

    return (await query.get()).length;
  }

  Future<List<CustomerWithRegistration>> searchScreeningCustomers(Screening screening, String search) async {
    final query = select(screeningRegistrationsTable).join(
      [
        innerJoin(
          customersTable,
          customersTable.id.equalsExp(
            screeningRegistrationsTable.customerId,
          ),
        ),
        innerJoin(
          screeningTimeslotsTable,
          screeningTimeslotsTable.id.equalsExp(
            screeningRegistrationsTable.timeslotId,
          ),
          useColumns: false,
        ),
        leftOuterJoin(
          ordersTable,
          ordersTable.customerId.equalsExp(
                customersTable.id,
              ) &
              ordersTable.screeningId.equalsExp(
                screeningTimeslotsTable.screeningId,
              ),
          useColumns: false,
        ),
        leftOuterJoin(
          newOrdersTable,
          newOrdersTable.customerNric.equalsExp(
                customersTable.nric,
              ) &
              newOrdersTable.screeningId.equalsExp(
                screeningTimeslotsTable.screeningId,
              ),
          useColumns: false,
        ),
      ],
    );

    String refSearch = search.startsWith('r') ? search.substring(1) : search;
    query.where(screeningTimeslotsTable.screeningId.equals(screening.id));
    query.where(
      customersTable.fullName.like("%$search%") |
          customersTable.nric.like("%$search%") |
          screeningRegistrationsTable.index.like("$refSearch%"),
    );

    final ordersCount = ordersTable.id.count();
    final newOrdersCount = newOrdersTable.id.count();
    query.addColumns([ordersCount, newOrdersCount]);

    final index = coalesce([
      screeningRegistrationsTable.index,
      customersTable.nric.substr(-5, 5),
    ]);
    query.addColumns([index]);

    query.orderBy([
      OrderingTerm.asc(screeningRegistrationsTable.index.cast<int>(), nulls: NullsOrder.last),
      OrderingTerm.asc(index)
    ]);
    query.groupBy([customersTable.id]);
    query.limit(50);

    return (await query.get()).map((row) {
      return CustomerWithRegistration(
        customer: row.readTable(customersTable),
        registration: row.readTable(screeningRegistrationsTable).copyWith(
              index: row.read(index),
              hasOrders: (row.read(ordersCount) ?? 0) > 0 || (row.read(newOrdersCount) ?? 0) > 0,
            ),
      );
    }).toList();
  }
}
