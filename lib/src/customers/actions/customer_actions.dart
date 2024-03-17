import 'package:hop_pos/src/customers/models/customer.dart';
import 'package:hop_pos/src/customers/models/customer_with_registration.dart';
import 'package:hop_pos/src/customers/models/customer_with_screenings_and_orders.dart';
import 'package:hop_pos/src/customers/repositories/customer_repository.dart';
import 'package:hop_pos/src/customers/repositories/new_customer_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'customer_actions.g.dart';

@riverpod
CustomerActions customerActions(CustomerActionsRef ref) {
  return CustomerActions(
    customerRepo: ref.watch(customerRepoProvider),
    newCustomerRepo: ref.watch(newCustomerRepoProvider),
  );
}

class CustomerActions {
  final CustomerRepository customerRepo;
  final NewCustomerRepository newCustomerRepo;

  CustomerActions({
    required this.customerRepo,
    required this.newCustomerRepo,
  });

  Future<Customer?> findByNric({required String nric, int? excludeId}) async {
    final customer = await customerRepo.findByNric(nric: nric, excludeId: excludeId);
    final newCustomer = await newCustomerRepo.findByNric(nric: nric, excludeId: excludeId);

    return customer ?? newCustomer;
  }

  Future<bool> isMobileNoTaken({required String mobileNo, int? excludeId}) async {
    final customer = await customerRepo.findByMobileNo(mobileNo: mobileNo, excludeId: excludeId);
    final newCustomer = await newCustomerRepo.findByMobileNo(mobileNo: mobileNo, excludeId: excludeId);

    return customer != null || newCustomer != null;
  }

  Future<bool> isEmailTaken({required String email, int? excludeId}) async {
    final customer = await customerRepo.findByEmail(email: email, excludeId: excludeId);
    final newCustomer = await newCustomerRepo.findByEmail(email: email, excludeId: excludeId);

    return customer != null || newCustomer != null;
  }

  Future<bool> update(Customer customer) async {
    final dynamic repo = customer.isNew ? newCustomerRepo : customerRepo;
    return repo.update(customer);
  }

  Future<Customer> store(Customer customer) async {
    return newCustomerRepo.insert(customer.toData());
  }

  Future<CustomerWithScreeningsAndOrders?> findCustomerDetail(String nric) async {
    final customer = await customerRepo.findCustomerDetail(nric);

    return customer;
  }

  Future<CustomerWithRegistration?> getLatestRegistration(Customer customer) async {
    final dynamic repo = customer.isNew ? newCustomerRepo : customerRepo;
    List<CustomerWithRegistration> screenings = await repo.getCustomerScreenings(customer);

    final date = DateTime.now().subtract(const Duration(days: 14));
    final screening =
        screenings.where((screening) => screening.timeslot?.dateAndTime.isAfter(date) == true).firstOrNull;

    return screening ?? screenings.firstOrNull;
  }
}
