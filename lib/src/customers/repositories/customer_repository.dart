import 'package:hop_pos/app/app_db.dart';
import 'package:hop_pos/src/customers/daos/customer_dao.dart';
import 'package:hop_pos/src/customers/models/customer.dart';
import 'package:hop_pos/src/customers/models/customer_with_registration.dart';
import 'package:hop_pos/src/customers/models/customer_with_screenings_and_orders.dart';
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

  Future<bool> update(Customer customer) async {
    return await customerDao.updateCustomer(customer);
  }

  Future<CustomerWithScreeningsAndOrders?> findCustomerDetail(String nric) async {
    return await customerDao.findCustomerDetail(nric);
  }

  Future<List<CustomerWithRegistration>> getCustomerScreenings(Customer customer) async {
    return await customerDao.getCustomerScreenings(customer);
  }

  Future<bool> deleteById(int id) async {
    return customerDao.deleteById(id);
  }
}
