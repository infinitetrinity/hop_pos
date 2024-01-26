import 'package:hop_pos/app/app_db.dart';
import 'package:hop_pos/src/customers/daos/customer_dao.dart';
import 'package:hop_pos/src/customers/models/customer.dart';
import 'package:hop_pos/src/customers/models/customer_with_registration.dart';
import 'package:hop_pos/src/screenings/models/screening.dart';
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

  Future<List<CustomerWithRegistration>> searchScreening(Screening screening, String search) {
    return customerDao.searchScreening(screening, search);
  }

  Future<Customer> insert(CustomersTableCompanion customer) async {
    return await customerDao.insertCustomer(customer);
  }

  Future<Customer?> findByNric({required String nric, int? notId}) async {
    return await customerDao.findByNric(nric: nric, notId: notId);
  }

  Future<Customer?> findByMobileNo({required String mobileNo, int? notId}) async {
    return await customerDao.findByMobileNo(mobileNo: mobileNo, notId: notId);
  }

  Future<Customer?> findByEmail({required String email, int? notId}) async {
    return await customerDao.findByEmail(email: email, notId: notId);
  }

  Future<List<Customer>> insertMany(List<CustomersTableCompanion> customers) async {
    return await customerDao.insertCustomers(customers);
  }
}
