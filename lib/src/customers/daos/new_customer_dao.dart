import 'package:drift/drift.dart';
import 'package:hop_pos/app/app_db.dart';
import 'package:hop_pos/src/customers/models/customer.dart';
import 'package:hop_pos/src/customers/models/new_customers_table.dart';

part 'new_customer_dao.g.dart';

@DriftAccessor(tables: [NewCustomersTable])
class NewCustomerDao extends DatabaseAccessor<AppDb>
    with _$NewCustomerDaoMixin {
  NewCustomerDao(AppDb db) : super(db);

  Future<Customer> insertCustomer(NewCustomersTableCompanion customer) async {
    return await into(newCustomersTable).insertReturning(customer);
  }

  Future<bool> updateCustomer(
      NewCustomersTableCompanion customer, Expression<bool> where) async {
    final count = await (db.update(newCustomersTable)..where((tbl) => where))
        .write(customer);

    return count > 0;
  }
}
