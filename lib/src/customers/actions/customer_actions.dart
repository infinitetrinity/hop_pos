import 'package:hop_pos/src/customers/models/customer.dart';
import 'package:hop_pos/src/customers/models/customer_form.dart';
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
    return await customerRepo.findByNric(nric: nric, excludeId: excludeId);
  }

  Future<bool> isMobileNoTaken({required String mobileNo, int? excludeId}) async {
    final customer = await customerRepo.findByMobileNo(mobileNo: mobileNo, excludeId: excludeId);
    return customer != null;
  }

  Future<bool> isEmailTaken({required String email, int? excludeId}) async {
    final customer = await customerRepo.findByEmail(email: email, excludeId: excludeId);
    return customer != null;
  }

  Future<bool> updateCustomer(CustomerForm form) async {
    if (form.id == null) {
      return false;
    }

    final customer = Customer.fromJson(form.toJson());
    final dynamic repo = customer.isNew ? newCustomerRepo : customerRepo;
    return repo.update(customer);
  }
}
