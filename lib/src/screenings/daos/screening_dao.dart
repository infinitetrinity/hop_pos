import 'package:drift/drift.dart';
import 'package:hop_pos/app/app_db.dart';
import 'package:hop_pos/src/screenings/models/screening.dart';
import 'package:hop_pos/src/screenings/models/screenings_table.dart';

part 'screening_dao.g.dart';

@DriftAccessor(tables: [ScreeningsTable])
class ScreeningDao extends DatabaseAccessor<AppDb> with _$ScreeningDaoMixin {
  ScreeningDao(AppDb db) : super(db);

  Future<Screening> insertScreening(ScreeningsTableCompanion screening) async {
    return await into(screeningsTable).insertReturning(screening);
  }

  Future<List<Screening>> insertScreenings(
      List<ScreeningsTableCompanion> screenings) async {
    return await transaction(() async {
      List<Future<Screening>> insertFutures = [];

      for (ScreeningsTableCompanion screening in screenings) {
        insertFutures.add(insertScreening(screening));
      }

      List<Screening> result = await Future.wait(insertFutures);
      return result;
    });
  }

  Future<bool> updateScreening(
      ScreeningsTableCompanion screening, Expression<bool> where) async {
    final count =
        await (update(screeningsTable)..where((_) => where)).write(screening);
    return count > 0;
  }
}
