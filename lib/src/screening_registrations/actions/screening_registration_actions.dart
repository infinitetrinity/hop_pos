import 'package:hop_pos/src/customers/models/customer.dart';
import 'package:hop_pos/src/screening_registrations/models/screening_registration.dart';
import 'package:hop_pos/src/screening_registrations/repositories/new_screening_registration_repository.dart';
import 'package:hop_pos/src/screening_registrations/repositories/screening_registration_repository.dart';
import 'package:hop_pos/src/screenings/actions/screening_actions.dart';
import 'package:hop_pos/src/screenings/models/screening.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'screening_registration_actions.g.dart';

@riverpod
ScreeningRegistrationActions screeningRegistrationActions(ScreeningRegistrationActionsRef ref) {
  return ScreeningRegistrationActions(
    screeningRegistrationRepo: ref.watch(screeningRegistrationRepoProvider),
    newScreeningRegistrationRepo: ref.watch(newScreeningRegistrationRepoProvider),
    screeningActions: ref.watch(screeningActionsProvider),
  );
}

class ScreeningRegistrationActions {
  final ScreeningRegistrationRepository screeningRegistrationRepo;
  final NewScreeningRegistrationRepository newScreeningRegistrationRepo;
  final ScreeningActions screeningActions;

  ScreeningRegistrationActions({
    required this.screeningRegistrationRepo,
    required this.newScreeningRegistrationRepo,
    required this.screeningActions,
  });

  Future<int?> getCustomersCount(Screening screening) async {
    final registrationsCount = await screeningRegistrationRepo.getScreeningRegistrationsCount(screening);
    final newRegistrationsCount = await newScreeningRegistrationRepo.getScreeningRegistrationsCount(screening);

    return registrationsCount + newRegistrationsCount;
  }

  Future<ScreeningRegistration?> findByCustomerAndScreening(Screening screening, Customer customer) async {
    final registration = await screeningRegistrationRepo.findByCustomerAndScreening(customer, screening);
    final newRegistration = await newScreeningRegistrationRepo.findByCustomerAndScreening(customer, screening);

    return registration ?? newRegistration;
  }

  Future<ScreeningRegistration> store(Screening screening, Customer customer) async {
    final timeslot = await screeningActions.getScreeningNearestTimeslot(screening);
    return await newScreeningRegistrationRepo.store(customer, timeslot);
  }
}
