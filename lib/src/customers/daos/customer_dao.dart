import 'package:drift/drift.dart';
import 'package:hop_pos/app/app_db.dart';
import 'package:hop_pos/src/customers/models/customer.dart';
import 'package:hop_pos/src/customers/models/customer_with_registration.dart';
import 'package:hop_pos/src/customers/models/customers_table.dart';
import 'package:hop_pos/src/orders/models/orders_table.dart';
import 'package:hop_pos/src/screening_registrations/models/new_screening_registrations_table.dart';
import 'package:hop_pos/src/screening_registrations/models/screening_registrations_table.dart';
import 'package:hop_pos/src/screenings/models/screening.dart';

part 'customer_dao.g.dart';

@DriftAccessor(tables: [
  CustomersTable,
  ScreeningRegistrationsTable,
  NewScreeningRegistrationsTable,
  OrdersTable,
])
class CustomerDao extends DatabaseAccessor<AppDb> with _$CustomerDaoMixin {
  CustomerDao(AppDb db) : super(db);

  Future<List<CustomerWithRegistration>> searchScreening(Screening screening, String search) async {
    print('screeningg $screening');

    final query = select(customersTable).join(
      [
        leftOuterJoin(
          screeningRegistrationsTable,
          screeningRegistrationsTable.customerId.equalsExp(
            customersTable.id,
          ),
        ),
        leftOuterJoin(
          newScreeningRegistrationsTable,
          newScreeningRegistrationsTable.customerNric.equalsExp(
            customersTable.nric,
          ),
        ),
        leftOuterJoin(
          screeningTimeslotsTable,
          screeningTimeslotsTable.id.equalsExp(
                screeningRegistrationsTable.timeslotId,
              ) |
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
      ],
    );

    String refSearch = search.startsWith('r') ? search.substring(1) : search;
    query.where(screeningTimeslotsTable.screeningId.equals(screening.id));
    query.where(customersTable.fullName.like("%$search%") |
        customersTable.nric.like("%$search%") |
        screeningRegistrationsTable.index.like("$refSearch%"));

    final salesCount = ordersTable.id.count();
    query.addColumns([salesCount]);

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
    query.limit(20);

    return (await query.get()).map((row) {
      return CustomerWithRegistration(
        customer: row.readTable(customersTable),
        registration: row.readTable(screeningRegistrationsTable).copyWith(index: row.read(index)),
        hasSales: (row.read(salesCount) ?? 0) > 0,
      );
    }).toList();
  }

  Future<Customer?> findByNric({required String nric, int? excludeId}) async {
    final query = select(customersTable)..where((table) => table.nric.isValue(nric.toUpperCase()));
    if (excludeId != null) {
      query.where((table) => table.id.isNotValue(excludeId));
    }

    return (await query.get()).firstOrNull;
  }

  Future<Customer?> findByMobileNo({required String mobileNo, int? excludeId}) async {
    final query = select(customersTable)..where((table) => table.mobileNo.isValue(mobileNo));
    if (excludeId != null) {
      query.where((table) => table.id.isNotValue(excludeId));
    }

    return (await query.get()).firstOrNull;
  }

  Future<Customer?> findByEmail({required String email, int? excludeId}) async {
    final query = select(customersTable)..where((table) => table.email.isValue(email));
    if (excludeId != null) {
      query.where((table) => table.id.isNotValue(excludeId));
    }

    return (await query.get()).firstOrNull;
  }

  Future<Customer> insertCustomer(CustomersTableCompanion customer) async {
    return await into(customersTable).insertReturning(customer);
  }

  Future<List<Customer>> insertCustomers(List<CustomersTableCompanion> customers) async {
    return await transaction(() async {
      List<Future<Customer>> insertFutures = [];

      for (CustomersTableCompanion customer in customers) {
        insertFutures.add(insertCustomer(customer));
      }

      List<Customer> result = await Future.wait(insertFutures);
      return result;
    });
  }

  Future<bool> updateCustomer(CustomersTableCompanion customer, Expression<bool> where) async {
    final count = await (db.update(customersTable)..where((tbl) => where)).write(customer);

    return count > 0;
  }
}
