import 'package:drift/drift.dart';
import 'package:hop_pos/app/app_db.dart';
import 'package:hop_pos/src/customers/models/customer.dart';
import 'package:hop_pos/src/customers/models/customers_table.dart';
import 'package:hop_pos/src/screening_registrations/models/screening_registration.dart';
import 'package:hop_pos/src/screening_registrations/models/screening_registrations_table.dart';
import 'package:hop_pos/src/screenings/models/screening.dart';

part 'screening_registration_dao.g.dart';

@DriftAccessor(tables: [
  ScreeningRegistrationsTable,
  CustomersTable,
])
class ScreeningRegistrationDao extends DatabaseAccessor<AppDb>
    with _$ScreeningRegistrationDaoMixin {
  ScreeningRegistrationDao(AppDb db) : super(db);

  Future<ScreeningRegistration?> findByCustomerAndScreening(
      Customer customer, Screening screening) async {
    final query = select(screeningRegistrationsTable).join(
      [
        innerJoin(
          customersTable,
          customersTable.id.equalsExp(
            screeningRegistrationsTable.customerId,
          ),
        ),
        innerJoin(
          screeningTimeslotsTable,
          screeningTimeslotsTable.id.equalsExp(
            screeningRegistrationsTable.timeslotId,
          ),
          useColumns: false,
        ),
        innerJoin(
          screeningsTable,
          screeningsTable.id.equalsExp(
            screeningTimeslotsTable.screeningId,
          ),
          useColumns: false,
        )
      ],
    );

    query.where(screeningRegistrationsTable.customerId.isValue(customer.id!));
    query.where(screeningsTable.id.isValue(screening.id));

    final index = coalesce([
      screeningRegistrationsTable.index,
      customersTable.nric.substr(-5, 5),
    ]);
    query.addColumns([index]);

    return (await query.get()).map((row) {
      return row
          .readTable(screeningRegistrationsTable)
          .copyWith(index: row.read(index));
    }).firstOrNull;
  }

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

  Future<int> getScreeningRegistrationsCount(Screening screening) async {
    final query = select(screeningRegistrationsTable).join(
      [
        innerJoin(
          customersTable,
          customersTable.id.equalsExp(
            screeningRegistrationsTable.customerId,
          ),
          useColumns: false,
        ),
        innerJoin(
          screeningTimeslotsTable,
          screeningTimeslotsTable.id.equalsExp(
            screeningRegistrationsTable.timeslotId,
          ),
          useColumns: false,
        ),
        innerJoin(
          screeningsTable,
          screeningsTable.id.equalsExp(
            screeningTimeslotsTable.screeningId,
          ),
          useColumns: false,
        )
      ],
    );

    query.where(screeningsTable.id.isValue(screening.id));

    return (await query.get()).length;
  }
}
