import 'package:drift/drift.dart';
import 'package:hop_pos/app/app_db.dart';
import 'package:hop_pos/src/customers/daos/customer_dao.dart';
import 'package:hop_pos/src/customers/models/customer.dart';
import 'package:hop_pos/src/to_sync_data/daos/to_sync_data_dao.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'customer_repository.g.dart';

@riverpod
CustomerRepository customerRepo(CustomerRepoRef ref) {
  return CustomerRepository(
    db: ref.watch(appDbProvider),
    customerDao: ref.watch(appDbProvider.select((prov) => prov.customerDao)),
    toSycnDataDao: ref.watch(appDbProvider.select((prov) => prov.toSycnDataDao)),
  );
}

class CustomerRepository {
  final AppDb db;
  final CustomerDao customerDao;
  final ToSycnDataDao toSycnDataDao;

  CustomerRepository({
    required this.db,
    required this.customerDao,
    required this.toSycnDataDao,
  });

  Future<Customer?> findByNric({required String nric, int? excludeId}) async {
    return await customerDao.findByNric(nric: nric, excludeId: excludeId);
  }

  Future<Customer?> findByMobileNo({required String mobileNo, int? excludeId}) async {
    return await customerDao.findByMobileNo(mobileNo: mobileNo, excludeId: excludeId);
  }

  Future<Customer?> findByEmail({required String email, int? excludeId}) async {
    return await customerDao.findByEmail(email: email, excludeId: excludeId);
  }

  Future<Customer> insert(CustomersTableCompanion customer) async {
    return await customerDao.insertCustomer(customer);
  }

  Future<List<Customer>> insertMany(List<CustomersTableCompanion> customers) async {
    return await customerDao.insertCustomers(customers);
  }

  Future<bool> update(Customer customer, {Expression<bool>? where}) async {
    return await db.transaction(() async {
      final result =
          await customerDao.updateCustomer(customer.toData(), where ?? db.customersTable.id.equals(customer.id!));

      await toSycnDataDao.insertToSyncData(customer.toSyncData());

      return result;
    });
  }
}
