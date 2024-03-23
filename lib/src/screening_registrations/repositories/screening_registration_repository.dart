import 'package:hop_pos/app/app_db.dart';
import 'package:hop_pos/src/screening_registrations/daos/screening_registration_dao.dart';
import 'package:hop_pos/src/screening_registrations/models/screening_registration.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'screening_registration_repository.g.dart';

@riverpod
ScreeningRegistrationRepository screeningRegistrationRepo(ScreeningRegistrationRepoRef ref) {
  return ScreeningRegistrationRepository(
    screeningRegistrationDao: ref.watch(appDbProvider.select((prov) => prov.screeningRegistrationDao)),
  );
}

class ScreeningRegistrationRepository {
  final ScreeningRegistrationDao screeningRegistrationDao;

  ScreeningRegistrationRepository({
    required this.screeningRegistrationDao,
  });

  Future<ScreeningRegistration> insert(ScreeningRegistrationsTableCompanion registration) async {
    return await screeningRegistrationDao.insertScreeningRegistration(registration);
  }

  Future<List<ScreeningRegistration>> insertMany(List<ScreeningRegistrationsTableCompanion> registrations) async {
    return await screeningRegistrationDao.insertScreeningRegistrations(registrations);
  }

  Future<bool> deleteById(int timeslotId, int customerId) async {
    return screeningRegistrationDao.deleteById(timeslotId, customerId);
  }
}
