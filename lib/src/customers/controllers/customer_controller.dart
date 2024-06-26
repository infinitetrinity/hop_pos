import 'package:hop_pos/src/customers/actions/customer_actions.dart';
import 'package:hop_pos/src/customers/models/customer.dart';
import 'package:hop_pos/src/customers/models/customer_form.dart';
import 'package:hop_pos/src/customers/models/customer_with_registration.dart';
import 'package:hop_pos/src/pos/controllers/pos_controller.dart';
import 'package:hop_pos/src/screenings/actions/screening_actions.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'customer_controller.g.dart';

@riverpod
class CustomerController extends _$CustomerController {
  @override
  void build() {
    return;
  }

  Future<Customer?> findByNric({required String nric, int? excludeId}) async {
    return await ref.read(customerActionsProvider).findByNric(nric: nric, excludeId: excludeId);
  }

  Future<bool> isMobileNoTaken({required String mobileNo, int? excludeId}) async {
    return await ref.read(customerActionsProvider).isMobileNoTaken(mobileNo: mobileNo, excludeId: excludeId);
  }

  Future<bool> isEmailTaken({required String email, int? excludeId}) async {
    return await ref.read(customerActionsProvider).isEmailTaken(email: email, excludeId: excludeId);
  }

  Future<bool> updateCustomer(CustomerForm form) async {
    if (form.id == null) {
      return false;
    }

    return await ref.read(customerActionsProvider).update(Customer.fromJson(form.toJson()));
  }

  FutureOr<List<CustomerWithRegistration>> search(String search) async {
    final screening = ref.watch(posControllerProvider.select((prov) => prov.screening));
    if (screening == null) {
      return [];
    }

    return await ref.read(screeningActionsProvider).searchScreeningCustomers(screening, search);
  }

  Future<Customer> storeCustomer(Customer customer) async {
    return await ref.read(customerActionsProvider).store(customer);
  }

  Future<bool> setLatestScreeningPos(Customer customer) async {
    final registration = await ref.watch(customerActionsProvider).getLatestRegistration(customer);
    if (registration == null) {
      return false;
    }

    ref.read(posControllerProvider.notifier).setScreening(registration.screening);
    await ref
        .read(posControllerProvider.notifier)
        .selectCustomer(customer: registration.customer, registration: registration.registration);

    return true;
  }
}
