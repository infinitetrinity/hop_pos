import 'package:hop_pos/app/app_db.dart';
import 'package:hop_pos/src/customers/models/customer.dart';
import 'package:hop_pos/src/customers/models/customer_with_registration.dart';
import 'package:hop_pos/src/screening_registrations/daos/new_screening_registration_dao.dart';
import 'package:hop_pos/src/screening_registrations/models/screening_registration.dart';
import 'package:hop_pos/src/screenings/models/screening.dart';
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

  Future<List<CustomerWithRegistration>> searchScreeningCustomers(Screening screening, String search) async {
    return await newScreeningRegistrationDao.searchScreeningCustomers(screening, search);
  }

  Future<int> getNewScreeningRegistrationsCount(Screening screening) async {
    return await newScreeningRegistrationDao.getNewScreeningRegistrationsCount(screening);
  }

  Future<ScreeningRegistration?> findByCustomerAndScreening(Customer customer, Screening screening) async {
    return await newScreeningRegistrationDao.findByCustomerAndScreening(customer, screening);
  }
}
