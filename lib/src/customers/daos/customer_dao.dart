import 'package:drift/drift.dart';
import 'package:hop_pos/app/app_db.dart';
import 'package:hop_pos/src/customers/models/customer.dart';
import 'package:hop_pos/src/customers/models/customers_table.dart';

part 'customer_dao.g.dart';

@DriftAccessor(tables: [CustomersTable])
class CustomerDao extends DatabaseAccessor<AppDb> with _$CustomerDaoMixin {
  CustomerDao(AppDb db) : super(db);

  Future<Customer> insertCustomer(CustomersTableCompanion customer) async {
    return await into(customersTable).insertReturning(customer);
  }

  Future<List<Customer>> insertCustomers(
      List<CustomersTableCompanion> customers) async {
    return await transaction(() async {
      List<Future<Customer>> insertFutures = [];

      for (CustomersTableCompanion customer in customers) {
        insertFutures.add(insertCustomer(customer));
      }

      List<Customer> result = await Future.wait(insertFutures);
      return result;
    });
  }

  Future<bool> updateCustomer(
      CustomersTableCompanion customer, Expression<bool> where) async {
    final count =
        await (update(customersTable)..where((_) => where)).write(customer);
    return count > 0;
  }
}
