import 'package:drift/drift.dart';
import 'package:hop_pos/app/app_db.dart';
import 'package:hop_pos/src/customers/models/customer.dart';
import 'package:hop_pos/src/customers/models/customer_with_registration.dart';
import 'package:hop_pos/src/customers/models/customer_with_screenings_and_orders.dart';
import 'package:hop_pos/src/customers/models/customers_table.dart';
import 'package:hop_pos/src/orders/models/new_orders_table.dart';
import 'package:hop_pos/src/orders/models/orders_table.dart';
import 'package:hop_pos/src/screening_registrations/models/new_screening_registrations_table.dart';
import 'package:hop_pos/src/screening_registrations/models/screening_registrations_table.dart';
import 'package:hop_pos/src/to_sync_data/models/to_sync_data.dart';

part 'customer_dao.g.dart';

@DriftAccessor(tables: [
  CustomersTable,
  ScreeningRegistrationsTable,
  NewScreeningRegistrationsTable,
  OrdersTable,
  NewOrdersTable,
])
class CustomerDao extends DatabaseAccessor<AppDb> with _$CustomerDaoMixin {
  CustomerDao(AppDb db) : super(db);

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

  Future<bool> updateCustomer(Customer customer) async {
    return await transaction(() async {
      final count =
          await (update(customersTable)..where((tbl) => tbl.id.equals(customer.id!))).write(customer.toData());

      await db.toSycnDataDao.insertToSyncData(customer.toSyncData(ToSyncActions.update));
      return count > 0;
    });
  }

  Future<CustomerWithScreeningsAndOrders?> findCustomerDetail(String nric) async {
    Customer? customer = await findByNric(nric: nric);
    if (customer == null) {
      return null;
    }

    final screenings = await getCustomerScreenings(customer);
    final orders = await db.orderDao.getCustomerOrders(customer);
    //find new registration and orders

    return CustomerWithScreeningsAndOrders(
      customer: customer,
      screenings: screenings,
      orders: orders,
    );
  }

  Future<List<CustomerWithRegistration>> getCustomerScreenings(Customer customer) async {
    final query = select(screeningsTable).join(
      [
        innerJoin(
          screeningTimeslotsTable,
          screeningTimeslotsTable.screeningId.equalsExp(
            screeningsTable.id,
          ),
        ),
        leftOuterJoin(
          screeningRegistrationsTable,
          screeningRegistrationsTable.timeslotId.equalsExp(
            screeningTimeslotsTable.id,
          ),
        ),
        leftOuterJoin(
          newScreeningRegistrationsTable,
          newScreeningRegistrationsTable.timeslotId.equalsExp(
            screeningTimeslotsTable.id,
          ),
        ),
      ],
    )
      ..where(screeningRegistrationsTable.customerId.isValue(customer.id!) |
          newScreeningRegistrationsTable.customerNric.isValue(customer.nric!))
      ..orderBy([OrderingTerm.asc(screeningTimeslotsTable.dateAndTime)]);

    final index = coalesce([
      screeningRegistrationsTable.index,
      newScreeningRegistrationsTable.index,
      Constant(customer.nricIndex),
    ]);
    query.addColumns([index]);

    return (await query.get()).map((row) {
      final registration = row.readTableOrNull(screeningRegistrationsTable) == null
          ? row.readTable(newScreeningRegistrationsTable).copyWith(isNew: true)
          : row.readTable(screeningRegistrationsTable);

      return CustomerWithRegistration(
        customer: customer,
        screening: row.readTable(screeningsTable),
        timeslot: row.readTable(screeningTimeslotsTable),
        registration: registration.copyWith(index: row.read(index)),
      );
    }).toList();
  }
}
