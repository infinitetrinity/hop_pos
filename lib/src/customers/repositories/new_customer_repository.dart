import 'package:drift/drift.dart';
import 'package:hop_pos/app/app_db.dart';
import 'package:hop_pos/src/customers/daos/new_customer_dao.dart';
import 'package:hop_pos/src/customers/models/customer.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'new_customer_repository.g.dart';

@riverpod
NewCustomerRepository newCustomerRepo(NewCustomerRepoRef ref) {
  return NewCustomerRepository(
    db: ref.watch(appDbProvider),
    newCustomerDao:
        ref.watch(appDbProvider.select((prov) => prov.newCustomerDao)),
  );
}

class NewCustomerRepository {
  final AppDb db;
  final NewCustomerDao newCustomerDao;

  NewCustomerRepository({
    required this.db,
    required this.newCustomerDao,
  });

  Future<Customer> insert(NewCustomersTableCompanion customer) async {
    return await newCustomerDao.insertCustomer(customer);
  }

  Future<bool> update(Customer customer, {Expression<bool>? where}) async {
    return await newCustomerDao.updateCustomer(customer.toData(),
        where ?? db.newCustomersTable.id.equals(customer.id!));
  }
}
