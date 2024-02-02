import 'package:hop_pos/src/customers/models/customer.dart';
import 'package:hop_pos/src/customers/models/customer_with_registration.dart';
import 'package:hop_pos/src/screening_registrations/models/screening_registration.dart';
import 'package:hop_pos/src/screening_registrations/repositories/new_screening_registration_repository.dart';
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
    final registrationsCount =
        await ref.watch(screeningRegistrationRepoProvider).getScreeningRegistrationsCount(screening);
    final newRegistrationsCount =
        await ref.watch(newScreeningRegistrationRepoProvider).getNewScreeningRegistrationsCount(screening);

    return registrationsCount + newRegistrationsCount;
  }

  Future<ScreeningRegistration?> findByCustomerAndScreening(Screening screening, Customer customer) async {
    final registration =
        await ref.read(screeningRegistrationRepoProvider).findByCustomerAndScreening(customer, screening);
    final newRegistration =
        await ref.read(newScreeningRegistrationRepoProvider).findByCustomerAndScreening(customer, screening);

    return registration ?? newRegistration;
  }

  FutureOr<List<CustomerWithRegistration>> searchScreeningCustomers(Screening screening, String search) async {
    final registrations = await ref.read(screeningRegistrationRepoProvider).searchScreeningCustomers(screening, search);
    final newRegistrations =
        await ref.read(newScreeningRegistrationRepoProvider).searchScreeningCustomers(screening, search);

    final sorted = [...registrations, ...newRegistrations]..sort((a, b) {
        final intA = int.tryParse(a.registration.index ?? '');
        final intB = int.tryParse(b.registration.index ?? '');

        if (intA == null && intB == null) {
          return (a.registration.index ?? '').compareTo(b.registration.index ?? '');
        }
        if (intA == null) {
          return 1;
        }
        if (intB == null) {
          return -1;
        }

        return intA.compareTo(intB);
      });

    return sorted.take(50).toList();
  }
}
