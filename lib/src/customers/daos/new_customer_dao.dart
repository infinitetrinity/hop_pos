import 'package:drift/drift.dart';
import 'package:hop_pos/app/app_db.dart';
import 'package:hop_pos/src/customers/models/customer.dart';
import 'package:hop_pos/src/customers/models/new_customers_table.dart';

part 'new_customer_dao.g.dart';

@DriftAccessor(tables: [NewCustomersTable])
class NewCustomerDao extends DatabaseAccessor<AppDb> with _$NewCustomerDaoMixin {
  NewCustomerDao(AppDb db) : super(db);

  Future<Customer> insertCustomer(NewCustomersTableCompanion customer) async {
    return await into(newCustomersTable).insertReturning(customer);
  }

  Future<bool> updateCustomer(Customer customer) async {
    final count =
        await (update(newCustomersTable)..where((tbl) => tbl.id.equals(customer.id!))).write(customer.toData());

    return count > 0;
  }
}
