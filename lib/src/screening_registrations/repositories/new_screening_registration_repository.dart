import 'package:drift/drift.dart';
import 'package:hop_pos/app/app_db.dart';
import 'package:hop_pos/src/customers/models/customer.dart';
import 'package:hop_pos/src/screening_registrations/daos/new_screening_registration_dao.dart';
import 'package:hop_pos/src/screening_registrations/models/screening_registration.dart';
import 'package:hop_pos/src/screening_timeslots/models/screening_timeslot.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'new_screening_registration_repository.g.dart';

@riverpod
NewScreeningRegistrationRepository newScreeningRegistrationRepo(NewScreeningRegistrationRepoRef ref) {
  return NewScreeningRegistrationRepository(
    newScreeningRegistrationDao: ref.watch(appDbProvider.select((prov) => prov.newScreeningRegistrationDao)),
  );
}

class NewScreeningRegistrationRepository {
  final NewScreeningRegistrationDao newScreeningRegistrationDao;

  NewScreeningRegistrationRepository({
    required this.newScreeningRegistrationDao,
  });

  Future<ScreeningRegistration> insertNewScreeningRegistration(Customer customer, ScreeningTimeslot timeslot) async {
    return (await newScreeningRegistrationDao.insertNewScreeningRegistration(
      NewScreeningRegistrationsTableCompanion(
        customerNric: Value(customer.nric),
        timeslotId: Value(timeslot.id),
        createdAt: Value(DateTime.now()),
      ),
    ))
        .copyWith(isNew: true);
  }
}
