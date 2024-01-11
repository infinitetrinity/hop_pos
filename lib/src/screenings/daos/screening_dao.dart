import 'package:drift/drift.dart';
import 'package:hop_pos/app/app_db.dart';
import 'package:hop_pos/src/screening_timeslots/models/screening_timeslots_table.dart';
import 'package:hop_pos/src/screenings/models/screening.dart';
import 'package:hop_pos/src/screenings/models/screenings_table.dart';

part 'screening_dao.g.dart';

@DriftAccessor(tables: [
  ScreeningsTable,
  ScreeningTimeslotsTable,
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

  Stream<List<Screening>> getUpcoming() {
    final query = select(screeningsTable).join(
      [
        innerJoin(
          screeningTimeslotsTable,
          screeningTimeslotsTable.screeningId.equalsExp(
            screeningsTable.id,
          ),
        ),
      ],
    );

    query.where(screeningTimeslotsTable.dateAndTime.isSmallerOrEqualValue(DateTime.now()));

    query.groupBy([screeningsTable.id]);
    query.orderBy([OrderingTerm.desc(screeningTimeslotsTable.dateAndTime)]);
    query.limit(60);

    return query.watch().map((rows) {
      return rows.map((row) {
        return row.readTable(screeningsTable);
      }).toList();
    });
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
