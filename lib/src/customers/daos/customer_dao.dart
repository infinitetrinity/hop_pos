import 'package:drift/drift.dart';
import 'package:hop_pos/app/app_db.dart';
import 'package:hop_pos/src/customers/models/customer.dart';
import 'package:hop_pos/src/customers/models/customers_table.dart';
import 'package:hop_pos/src/orders/models/new_orders_table.dart';
import 'package:hop_pos/src/orders/models/orders_table.dart';
import 'package:hop_pos/src/screening_registrations/models/new_screening_registrations_table.dart';
import 'package:hop_pos/src/screening_registrations/models/screening_registrations_table.dart';

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

  Future<bool> updateCustomer(CustomersTableCompanion customer, Expression<bool> where) async {
    final count = await (db.update(customersTable)..where((tbl) => where)).write(customer);

    return count > 0;
  }
}
