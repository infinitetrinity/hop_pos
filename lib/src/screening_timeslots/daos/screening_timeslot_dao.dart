import 'package:drift/drift.dart';
import 'package:hop_pos/app/app_db.dart';
import 'package:hop_pos/src/screening_registrations/models/screening_registrations_table.dart';
import 'package:hop_pos/src/screening_timeslots/models/screening_timeslot.dart';
import 'package:hop_pos/src/screening_timeslots/models/screening_timeslot_with_venue.dart';
import 'package:hop_pos/src/screening_timeslots/models/screening_timeslots_table.dart';
import 'package:hop_pos/src/screening_venues/models/screening_venues_table.dart';
import 'package:hop_pos/src/screenings/models/screening.dart';
import 'package:hop_pos/src/screenings/models/screenings_table.dart';

part 'screening_timeslot_dao.g.dart';

@DriftAccessor(tables: [
  ScreeningsTable,
  ScreeningTimeslotsTable,
  ScreeningVenuesTable,
  ScreeningRegistrationsTable,
])
class ScreeningTimeslotDao extends DatabaseAccessor<AppDb> with _$ScreeningTimeslotDaoMixin {
  ScreeningTimeslotDao(AppDb db) : super(db);

  Future<List<ScreeningTimeslot>> getScreeningTimeslots(Screening screening) async {
    final query = select(screeningTimeslotsTable)
      ..where((table) => table.screeningId.equals(screening.id))
      ..orderBy([(table) => OrderingTerm.asc(table.dateAndTime)]);

    return (await query.get());
  }

  Future<int> getScreeningTimeslotsCount(Screening screening) async {
    final query = select(screeningTimeslotsTable)..where((table) => table.screeningId.equals(screening.id));
    return (await query.get()).length;
  }

  Future<List<ScreeningTimeslotWithVenue>> getScreeningTimeslotsWithVenue(Screening screening,
      {int page = 1, int size = 20}) async {
    final query = select(screeningsTable).join(
      [
        innerJoin(
          screeningVenuesTable,
          screeningVenuesTable.screeningFormId.equalsExp(
            screeningsTable.id,
          ),
        ),
        innerJoin(
          screeningTimeslotsTable,
          screeningTimeslotsTable.venueId.equalsExp(
            screeningVenuesTable.id,
          ),
        ),
        leftOuterJoin(
          screeningRegistrationsTable,
          screeningRegistrationsTable.timeslotId.equalsExp(
            screeningTimeslotsTable.id,
          ),
          useColumns: false,
        )
      ],
    );

    query.where(screeningsTable.id.equals(screening.id));
    query.orderBy([OrderingTerm.asc(screeningTimeslotsTable.dateAndTime)]);
    query.groupBy([screeningsTable.id, screeningVenuesTable.id, screeningTimeslotsTable.id]);
    query.limit(size, offset: ((page - 1) * size));

    final takenSlots = screeningRegistrationsTable.timeslotId.count();
    query.addColumns([takenSlots]);

    return (await query.get())
        .map((row) => ScreeningTimeslotWithVenue(
              timeslot: row.readTable(screeningTimeslotsTable).copyWith(customersCount: row.read(takenSlots)),
              venue: row.readTable(screeningVenuesTable),
            ))
        .toList();
  }

  Future<ScreeningTimeslot> insertScreeningTimeslot(ScreeningTimeslotsTableCompanion timeslot) async {
    return await into(screeningTimeslotsTable).insertReturning(timeslot);
  }

  Future<List<ScreeningTimeslot>> insertScreeningTimeslots(List<ScreeningTimeslotsTableCompanion> timeslots) async {
    return await transaction(() async {
      List<Future<ScreeningTimeslot>> insertFutures = [];

      for (ScreeningTimeslotsTableCompanion timeslot in timeslots) {
        insertFutures.add(insertScreeningTimeslot(timeslot));
      }

      List<ScreeningTimeslot> result = await Future.wait(insertFutures);
      return result;
    });
  }

  Future<bool> updateScreeningTimeslot(ScreeningTimeslotsTableCompanion timeslot, Expression<bool> where) async {
    final count = await (update(screeningTimeslotsTable)..where((_) => where)).write(timeslot);
    return count > 0;
  }

  Future<ScreeningTimeslot?> getById(int id) {
    final query = select(screeningTimeslotsTable)..where((tbl) => tbl.id.equals(id));
    return query.getSingleOrNull();
  }

  Future<bool> deleteById(int id) async {
    final count = await (delete(screeningTimeslotsTable)..where((tbl) => tbl.id.equals(id))).go();
    return count > 0;
  }

  Future<void> insertOrUpdateMany(List<ScreeningTimeslot> timeslots) async {
    for (final timeslot in timeslots) {
      await into(screeningTimeslotsTable).insert(timeslot.toData(), onConflict: DoUpdate((_) => timeslot.toData()));
    }
  }
}
