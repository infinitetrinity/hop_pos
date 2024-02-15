import 'package:hop_pos/app/app_db.dart';
import 'package:hop_pos/src/customers/daos/new_customer_dao.dart';
import 'package:hop_pos/src/customers/models/customer.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'new_customer_repository.g.dart';

@riverpod
NewCustomerRepository newCustomerRepo(NewCustomerRepoRef ref) {
  return NewCustomerRepository(
    newCustomerDao: ref.watch(appDbProvider.select((prov) => prov.newCustomerDao)),
  );
}

class NewCustomerRepository {
  final NewCustomerDao newCustomerDao;

  NewCustomerRepository({
    required this.newCustomerDao,
  });

  Future<Customer> insert(NewCustomersTableCompanion customer) async {
    return (await newCustomerDao.insertCustomer(customer)).copyWith(isNew: true);
  }

  Future<bool> update(Customer customer) async {
    return await newCustomerDao.updateCustomer(customer);
  }
}
