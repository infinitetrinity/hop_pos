import 'package:hop_pos/src/customers/models/customer.dart';
import 'package:hop_pos/src/customers/models/customer_form.dart';
import 'package:hop_pos/src/customers/repositories/customer_repository.dart';
import 'package:hop_pos/src/customers/repositories/new_customer_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'customer_actions.g.dart';

@riverpod
class CustomerActions extends _$CustomerActions {
  @override
  void build() {
    return;
  }

  Future<Customer?> findByNric({required String nric, int? excludeId}) async {
    final repo = ref.read(customerRepoProvider);
    return await repo.findByNric(nric: nric, excludeId: excludeId);
  }

  Future<bool> isMobileNoTaken({required String mobileNo, int? excludeId}) async {
    final repo = ref.read(customerRepoProvider);
    final customer = await repo.findByMobileNo(mobileNo: mobileNo, excludeId: excludeId);

    return customer != null;
  }

  Future<bool> isEmailTaken({required String email, int? excludeId}) async {
    final repo = ref.read(customerRepoProvider);
    final customer = await repo.findByEmail(email: email, excludeId: excludeId);

    return customer != null;
  }

  Future<bool> updateCustomer(CustomerForm form) async {
    if (form.id == null) {
      return false;
    }

    final customer = Customer.fromJson(form.toJson());
    final dynamic repo = customer.isNew ? ref.read(newCustomerRepoProvider) : ref.read(customerRepoProvider);

    return repo.update(customer);
  }
}
