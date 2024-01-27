import 'package:hop_pos/src/customers/models/customer.dart';
import 'package:hop_pos/src/pos/models/pos_cart.dart';
import 'package:hop_pos/src/screening_registrations/models/screening_registration.dart';
import 'package:hop_pos/src/screening_registrations/repositories/screening_registration_repository.dart';
import 'package:hop_pos/src/screenings/models/screening.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'pos_controller.g.dart';

@riverpod
class PosController extends _$PosController {
  @override
  PosCart build() {
    return const PosCart();
  }

  void setScreening(Screening screening) {
    state = state.copyWith(screening: screening);
  }

  FutureOr<void> selectCustomer({
    required Customer customer,
    ScreeningRegistration? registration,
  }) async {
    if (registration == null) {
      final repo = ref.read(screeningRegistrationRepoProvider);
      registration = state.screening == null ? null : await repo.findByCustomerAndScreening(customer, state.screening!);
    }

    state = state.copyWith(
      customer: customer,
      registration: registration,
    );
  }
}
