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

  Future<Customer?> findByNric({required String nric, int? excludeId}) async {
    final query = select(newCustomersTable)..where((table) => table.nric.isValue(nric.toUpperCase()));
    if (excludeId != null) {
      query.where((table) => table.id.isNotValue(excludeId));
    }

    return (await query.get()).firstOrNull;
  }

  Future<Customer?> findByMobileNo({required String mobileNo, int? excludeId}) async {
    final query = select(newCustomersTable)..where((table) => table.mobileNo.isValue(mobileNo));
    if (excludeId != null) {
      query.where((table) => table.id.isNotValue(excludeId));
    }

    return (await query.get()).firstOrNull;
  }

  Future<Customer?> findByEmail({required String email, int? excludeId}) async {
    final query = select(newCustomersTable)..where((table) => table.email.isValue(email));
    if (excludeId != null) {
      query.where((table) => table.id.isNotValue(excludeId));
    }

    return (await query.get()).firstOrNull;
  }

  Future<List<Customer>> getAll() {
    final query = select(newCustomersTable);

    query.orderBy([(table) => OrderingTerm.asc(table.id)]);
    return query.get();
  }

  Future<bool> deleteByIds(List<int> ids) async {
    final count = await (delete(newCustomersTable)..where((tbl) => tbl.id.isIn(ids))).go();
    return count > 0;
  }
}
