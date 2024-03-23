import 'package:drift/drift.dart';
import 'package:hop_pos/app/app_db.dart';
import 'package:hop_pos/src/customers/models/customers_table.dart';
import 'package:hop_pos/src/orders/models/new_orders_table.dart';
import 'package:hop_pos/src/orders/models/orders_table.dart';
import 'package:hop_pos/src/screening_registrations/models/screening_registration.dart';
import 'package:hop_pos/src/screening_registrations/models/screening_registrations_table.dart';
import 'package:hop_pos/src/screening_timeslots/models/screening_timeslots_table.dart';

part 'screening_registration_dao.g.dart';

@DriftAccessor(tables: [
  ScreeningRegistrationsTable,
  ScreeningTimeslotsTable,
  CustomersTable,
  OrdersTable,
  NewOrdersTable,
])
class ScreeningRegistrationDao extends DatabaseAccessor<AppDb> with _$ScreeningRegistrationDaoMixin {
  ScreeningRegistrationDao(AppDb db) : super(db);

  Future<ScreeningRegistration> insertScreeningRegistration(ScreeningRegistrationsTableCompanion registration) async {
    return await into(screeningRegistrationsTable).insertReturning(registration);
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

  Future<bool> deleteById(int timeslotId, int customerId) async {
    final count = await (delete(screeningRegistrationsTable)
          ..where((tbl) => tbl.timeslotId.equals(timeslotId))
          ..where((tbl) => tbl.customerId.equals(customerId)))
        .go();
    return count > 0;
  }

  Future<void> insertOrUpdateMany(List<ScreeningRegistration> registrations) async {
    for (final registration in registrations) {
      await into(screeningRegistrationsTable).insert(registration.toData(),
          onConflict: DoUpdate((_) => registration.toData(),
              target: [screeningRegistrationsTable.customerId, screeningRegistrationsTable.timeslotId]));
    }
  }
}
