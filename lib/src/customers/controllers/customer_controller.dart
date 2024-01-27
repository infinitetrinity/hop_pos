import 'package:hop_pos/src/customers/models/customer.dart';
import 'package:hop_pos/src/customers/repositories/customer_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'customer_controller.g.dart';

@riverpod
class CustomerController extends _$CustomerController {
  @override
  void build() {
    return;
  }

  Future<Customer?> isNricTaken({required String nric, int? excludeId}) async {
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
}
