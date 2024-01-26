import 'package:hop_pos/src/customers/repositories/customer_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'customer_controller.g.dart';

@riverpod
class CustomerController extends _$CustomerController {
  @override
  void build() {
    return;
  }

  Future<bool> isNricUnique({required String nric, int? customerId}) async {
    final repo = ref.read(customerRepoProvider);
    final customer = await repo.findByNric(nric: nric, notId: customerId);

    return customer == null;
  }

  Future<bool> isMobileNoUnique({required String mobileNo, int? customerId}) async {
    final repo = ref.read(customerRepoProvider);
    final customer = await repo.findByMobileNo(mobileNo: mobileNo, notId: customerId);

    return customer == null;
  }

  Future<bool> isEmailUnique({required String email, int? customerId}) async {
    final repo = ref.read(customerRepoProvider);
    final customer = await repo.findByEmail(email: email, notId: customerId);

    return customer == null;
  }
}
