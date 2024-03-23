import 'package:hop_pos/src/customers/models/customer.dart';
import 'package:hop_pos/src/screening_registrations/models/screening_registration.dart';
import 'package:hop_pos/src/screening_registrations/repositories/new_screening_registration_repository.dart';
import 'package:hop_pos/src/screenings/actions/screening_actions.dart';
import 'package:hop_pos/src/screenings/models/screening.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'screening_registration_actions.g.dart';

@riverpod
ScreeningRegistrationActions screeningRegistrationActions(ScreeningRegistrationActionsRef ref) {
  return ScreeningRegistrationActions(
    newScreeningRegistrationRepo: ref.watch(newScreeningRegistrationRepoProvider),
    screeningActions: ref.watch(screeningActionsProvider),
  );
}

class ScreeningRegistrationActions {
  final NewScreeningRegistrationRepository newScreeningRegistrationRepo;
  final ScreeningActions screeningActions;

  ScreeningRegistrationActions({
    required this.newScreeningRegistrationRepo,
    required this.screeningActions,
  });

  Future<ScreeningRegistration> insertNewScreeningRegistration(Screening screening, Customer customer) async {
    final timeslot = await screeningActions.getScreeningNearestTimeslot(screening);
    return await newScreeningRegistrationRepo.insertNewScreeningRegistration(customer, timeslot);
  }

  Future<List<ScreeningRegistration>> getAllNew() async {
    return newScreeningRegistrationRepo.getAll();
  }
}
