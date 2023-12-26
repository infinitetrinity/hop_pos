import 'package:drift/drift.dart';
import 'package:hop_pos/app/app_db.dart';
import 'package:hop_pos/src/screening_registrations/models/screening_registration.dart';
import 'package:hop_pos/src/screening_registrations/models/screening_registrations_table.dart';

part 'screening_registration_dao.g.dart';

@DriftAccessor(tables: [ScreeningRegistrationsTable])
class ScreeningRegistrationDao extends DatabaseAccessor<AppDb>
    with _$ScreeningRegistrationDaoMixin {
  ScreeningRegistrationDao(AppDb db) : super(db);

  Future<ScreeningRegistration> insertScreeningRegistration(
      ScreeningRegistrationsTableCompanion registration) async {
    return await into(screeningRegistrationsTable)
        .insertReturning(registration);
  }

  Future<List<ScreeningRegistration>> insertScreeningRegistrations(
      List<ScreeningRegistrationsTableCompanion> registrations) async {
    return await transaction(() async {
      List<Future<ScreeningRegistration>> insertFutures = [];

      for (ScreeningRegistrationsTableCompanion registration in registrations) {
        insertFutures.add(insertScreeningRegistration(registration));
      }

      List<ScreeningRegistration> result = await Future.wait(insertFutures);
      return result;
    });
  }

  Future<bool> updateScreeningRegistration(
      ScreeningRegistrationsTableCompanion registration,
      Expression<bool> where) async {
    final count = await (update(screeningRegistrationsTable)
          ..where((_) => where))
        .write(registration);
    return count > 0;
  }
}
