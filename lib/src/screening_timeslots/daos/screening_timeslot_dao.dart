import 'package:drift/drift.dart';
import 'package:hop_pos/app/app_db.dart';
import 'package:hop_pos/src/screening_timeslots/models/screening_timeslot.dart';
import 'package:hop_pos/src/screening_timeslots/models/screening_timeslots_table.dart';

part 'screening_timeslot_dao.g.dart';

@DriftAccessor(tables: [ScreeningTimeslotsTable])
class ScreeningTimeslotDao extends DatabaseAccessor<AppDb>
    with _$ScreeningTimeslotDaoMixin {
  ScreeningTimeslotDao(AppDb db) : super(db);

  Future<ScreeningTimeslot> insertScreeningTimeslot(
      ScreeningTimeslotsTableCompanion timeslot) async {
    return await into(screeningTimeslotsTable).insertReturning(timeslot);
  }

  Future<List<ScreeningTimeslot>> insertScreeningTimeslots(
      List<ScreeningTimeslotsTableCompanion> timeslots) async {
    return await transaction(() async {
      List<Future<ScreeningTimeslot>> insertFutures = [];

      for (ScreeningTimeslotsTableCompanion timeslot in timeslots) {
        insertFutures.add(insertScreeningTimeslot(timeslot));
      }

      List<ScreeningTimeslot> result = await Future.wait(insertFutures);
      return result;
    });
  }

  Future<bool> updateScreeningTimeslot(
      ScreeningTimeslotsTableCompanion timeslot, Expression<bool> where) async {
    final count = await (update(screeningTimeslotsTable)..where((_) => where))
        .write(timeslot);
    return count > 0;
  }
}
