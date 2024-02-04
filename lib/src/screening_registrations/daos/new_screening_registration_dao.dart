import 'package:drift/drift.dart';
import 'package:hop_pos/app/app_db.dart';
import 'package:hop_pos/src/customers/models/customer.dart';
import 'package:hop_pos/src/customers/models/customer_with_registration.dart';
import 'package:hop_pos/src/customers/models/customers_table.dart';
import 'package:hop_pos/src/customers/models/new_customers_table.dart';
import 'package:hop_pos/src/orders/models/new_orders_table.dart';
import 'package:hop_pos/src/orders/models/orders_table.dart';
import 'package:hop_pos/src/screening_registrations/models/new_screening_registrations_table.dart';
import 'package:hop_pos/src/screening_registrations/models/screening_registration.dart';
import 'package:hop_pos/src/screening_timeslots/models/screening_timeslots_table.dart';
import 'package:hop_pos/src/screenings/models/screening.dart';

part 'new_screening_registration_dao.g.dart';

@DriftAccessor(tables: [
  NewScreeningRegistrationsTable,
  ScreeningTimeslotsTable,
  CustomersTable,
  NewCustomersTable,
  OrdersTable,
  NewOrdersTable,
])
class NewScreeningRegistrationDao extends DatabaseAccessor<AppDb> with _$NewScreeningRegistrationDaoMixin {
  NewScreeningRegistrationDao(AppDb db) : super(db);

  Future<List<CustomerWithRegistration>> searchScreeningCustomers(Screening screening, String search) async {
    final query = select(newScreeningRegistrationsTable).join(
      [
        leftOuterJoin(
          customersTable,
          customersTable.nric.equalsExp(
            newScreeningRegistrationsTable.customerNric,
          ),
        ),
        leftOuterJoin(
          newCustomersTable,
          newCustomersTable.nric.equalsExp(
            newScreeningRegistrationsTable.customerNric,
          ),
        ),
        innerJoin(
          screeningTimeslotsTable,
          screeningTimeslotsTable.id.equalsExp(
            newScreeningRegistrationsTable.timeslotId,
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
          newCustomersTable.fullName.like("%$search%") |
          newCustomersTable.nric.like("%$search%") |
          newScreeningRegistrationsTable.index.like("$refSearch%"),
    );

    final ordersCount = ordersTable.id.count();
    final newOrdersCount = newOrdersTable.id.count();
    query.addColumns([ordersCount, newOrdersCount]);

    final index = coalesce([
      newScreeningRegistrationsTable.index,
      customersTable.nric.substr(-5, 5),
      newCustomersTable.nric.substr(-5, 5),
    ]);
    query.addColumns([index]);

    query.orderBy([
      OrderingTerm.asc(newScreeningRegistrationsTable.index.cast<int>(), nulls: NullsOrder.last),
      OrderingTerm.asc(index)
    ]);
    query.groupBy([customersTable.id, newCustomersTable.id]);
    query.limit(50);

    return (await query.get()).map((row) {
      final customer =
          row.readTableOrNull(customersTable) ?? row.readTableOrNull(newCustomersTable)?.copyWith(isNew: true);

      return CustomerWithRegistration(
        customer: customer!,
        registration: row.readTable(newScreeningRegistrationsTable).copyWith(
              index: row.read(index),
              isNew: true,
              hasOrders: (row.read(ordersCount) ?? 0) > 0 || (row.read(newOrdersCount) ?? 0) > 0,
            ),
      );
    }).toList();
  }

  Future<int> getScreeningRegistrationsCount(Screening screening) async {
    final query = select(newScreeningRegistrationsTable).join(
      [
        innerJoin(
          screeningTimeslotsTable,
          screeningTimeslotsTable.id.equalsExp(
            newScreeningRegistrationsTable.timeslotId,
          ),
          useColumns: false,
        ),
      ],
    );

    query.where(screeningTimeslotsTable.screeningId.isValue(screening.id));

    return (await query.get()).length;
  }

  Future<ScreeningRegistration?> findByCustomerAndScreening(Customer customer, Screening screening) async {
    final query = select(newScreeningRegistrationsTable).join(
      [
        leftOuterJoin(
          customersTable,
          customersTable.nric.equalsExp(
            newScreeningRegistrationsTable.customerNric,
          ),
        ),
        leftOuterJoin(
          newCustomersTable,
          newCustomersTable.nric.equalsExp(
            newScreeningRegistrationsTable.customerNric,
          ),
        ),
        innerJoin(
          screeningTimeslotsTable,
          screeningTimeslotsTable.id.equalsExp(
            newScreeningRegistrationsTable.timeslotId,
          ),
          useColumns: false,
        ),
      ],
    );

    query.where(newScreeningRegistrationsTable.customerNric.isValue(customer.nric!));
    query.where(screeningTimeslotsTable.screeningId.isValue(screening.id));

    final index = coalesce([
      newScreeningRegistrationsTable.index,
      customersTable.nric.substr(-5, 5),
    ]);
    query.addColumns([index]);

    return (await query.get()).map((row) {
      return row.readTable(newScreeningRegistrationsTable).copyWith(index: row.read(index), isNew: true);
    }).firstOrNull;
  }
}
