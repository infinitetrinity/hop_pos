import 'package:hop_pos/src/customers/models/customer.dart';
import 'package:hop_pos/src/screening_registrations/models/screening_registration.dart';
import 'package:hop_pos/src/screening_registrations/repositories/screening_registration_repository.dart';
import 'package:hop_pos/src/screenings/models/screening.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'screening_registration_actions.g.dart';

@riverpod
class ScreeningRegistrationActions extends _$ScreeningRegistrationActions {
  @override
  void build() {
    return;
  }

  Future<int?> getCustomersCount(Screening screening) async {
    final repo = ref.watch(screeningRegistrationRepoProvider);
    return await repo.getScreeningRegistrationsCount(screening);
  }

  Future<ScreeningRegistration?> findByCustomerAndScreening(Screening screening, Customer customer) async {
    final repo = ref.read(screeningRegistrationRepoProvider);
    return await repo.findByCustomerAndScreening(customer, screening);
  }
}
