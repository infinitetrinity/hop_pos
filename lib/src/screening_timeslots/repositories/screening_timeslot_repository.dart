import 'package:drift/drift.dart';
import 'package:hop_pos/app/app_db.dart';
import 'package:hop_pos/src/screening_timeslots/daos/screening_timeslot_dao.dart';
import 'package:hop_pos/src/screening_timeslots/models/screening_timeslot.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'screening_timeslot_repository.g.dart';

@riverpod
ScreeningTimeslotRepository screeningTimeslotRepo(
    ScreeningTimeslotRepoRef ref) {
  return ScreeningTimeslotRepository(
    screeningTimeslotDao:
        ref.watch(appDbProvider.select((prov) => prov.screeningTimeslotDao)),
  );
}

class ScreeningTimeslotRepository {
  final ScreeningTimeslotDao screeningTimeslotDao;

  ScreeningTimeslotRepository({
    required this.screeningTimeslotDao,
  });

  Future<ScreeningTimeslot> insert(
      ScreeningTimeslotsTableCompanion timeslot) async {
    return await screeningTimeslotDao.insertScreeningTimeslot(timeslot);
  }

  Future<List<ScreeningTimeslot>> insertMany(
      List<ScreeningTimeslotsTableCompanion> timeslots) async {
    return await screeningTimeslotDao.insertScreeningTimeslots(timeslots);
  }

  Future<bool> update(
      ScreeningTimeslotsTableCompanion timeslot, Expression<bool> where) async {
    return await screeningTimeslotDao.updateScreeningTimeslot(timeslot, where);
  }
}
