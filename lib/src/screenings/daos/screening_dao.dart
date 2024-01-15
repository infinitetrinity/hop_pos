import 'package:drift/drift.dart';
import 'package:hop_pos/app/app_db.dart';
import 'package:hop_pos/src/screening_registrations/models/screening_registrations_table.dart';
import 'package:hop_pos/src/screening_timeslots/models/screening_timeslots_table.dart';
import 'package:hop_pos/src/screening_venues/models/screening_venue_with_timeslots.dart';
import 'package:hop_pos/src/screening_venues/models/screening_venues_table.dart';
import 'package:hop_pos/src/screenings/models/screening.dart';
import 'package:hop_pos/src/screenings/models/screening_with_venues_and_timeslots.dart';
import 'package:hop_pos/src/screenings/models/screenings_table.dart';

part 'screening_dao.g.dart';

@DriftAccessor(tables: [
  ScreeningsTable,
  ScreeningVenuesTable,
  ScreeningTimeslotsTable,
  ScreeningRegistrationsTable,
])
class ScreeningDao extends DatabaseAccessor<AppDb> with _$ScreeningDaoMixin {
  ScreeningDao(AppDb db) : super(db);

  Stream<List<Screening>> getAll(String? search) {
    final query = select(screeningsTable);

    if (search?.isNotEmpty == true) {
      query.where((table) => table.name.like("%$search%"));
    }

    query.orderBy([(table) => OrderingTerm.desc(table.name)]);
    return query.watch();
  }

  Future<List<Screening>> getUpcoming() async {
    final query = select(screeningsTable).join(
      [
        innerJoin(
          screeningTimeslotsTable,
          screeningTimeslotsTable.screeningId.equalsExp(
            screeningsTable.id,
          ),
          useColumns: false,
        ),
      ],
    );

    query.where(screeningTimeslotsTable.dateAndTime.isBetweenValues(
      DateTime.now(),
      DateTime.now().add(const Duration(days: 7)),
    ));
    query.orderBy([OrderingTerm.asc(screeningTimeslotsTable.dateAndTime)]);
    query.groupBy([screeningsTable.id]);
    query.limit(60);

    return (await query.get()).map((row) => row.readTable(screeningsTable)).toList();
  }

  Future<ScreeningWithVenuesAndTimeslots> getWithVenuesAndTimeslots(Screening screening) async {
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
    query.groupBy([screeningsTable.id, screeningVenuesTable.id, screeningTimeslotsTable.id]);

    final takenSlots = screeningRegistrationsTable.timeslotId.count();
    query.addColumns([takenSlots]);

    final result = await query.get();
    final venueMap = <int, ScreeningVenueWithTimeslots>{};

    for (final row in result) {
      final venue = row.readTable(screeningVenuesTable);
      final timeslot = row.readTable(screeningTimeslotsTable).copyWith(customersCount: row.read(takenSlots));

      venueMap[venue.id] = venueMap.containsKey(venue.id)
          ? venueMap[venue.id]!.copyWith(timeslots: [...venueMap[venue.id]!.timeslots, timeslot])
          : ScreeningVenueWithTimeslots(venue: venue, timeslots: [timeslot]);
    }

    return ScreeningWithVenuesAndTimeslots(
      screening: screening,
      venuesWithTimeslots: venueMap.values.toList(),
    );
  }

  Future<List<Screening>> search(String search) {
    final query = select(screeningsTable)..where((table) => table.name.like("%$search%"));
    query.orderBy([(table) => OrderingTerm.desc(table.id)]);
    query.limit(20);
    return query.get();
  }

  Future<Screening> insertScreening(ScreeningsTableCompanion screening) async {
    return await into(screeningsTable).insertReturning(screening);
  }

  Future<List<Screening>> insertScreenings(List<ScreeningsTableCompanion> screenings) async {
    return await transaction(() async {
      List<Future<Screening>> insertFutures = [];

      for (ScreeningsTableCompanion screening in screenings) {
        insertFutures.add(insertScreening(screening));
      }

      List<Screening> result = await Future.wait(insertFutures);
      return result;
    });
  }

  Future<bool> updateScreening(ScreeningsTableCompanion screening, Expression<bool> where) async {
    final count = await (update(screeningsTable)..where((_) => where)).write(screening);
    return count > 0;
  }
}
