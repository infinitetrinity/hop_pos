import 'package:drift/drift.dart';
import 'package:hop_pos/app/app_db.dart';
import 'package:hop_pos/src/customers/daos/customer_dao.dart';
import 'package:hop_pos/src/customers/models/customer.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'customer_repository.g.dart';

@riverpod
CustomerRepository customerRepo(CustomerRepoRef ref) {
  return CustomerRepository(
    customerDao: ref.watch(appDbProvider.select((prov) => prov.customerDao)),
  );
}

class CustomerRepository {
  final CustomerDao customerDao;

  CustomerRepository({
    required this.customerDao,
  });

  Future<Customer> insert(CustomersTableCompanion customer) async {
    return await customerDao.insertCustomer(customer);
  }

  Future<List<Customer>> insertMany(
      List<CustomersTableCompanion> customers) async {
    return await customerDao.insertCustomers(customers);
  }

  Future<bool> update(
      CustomersTableCompanion customer, Expression<bool> where) async {
    return await customerDao.updateCustomer(customer, where);
  }
}
