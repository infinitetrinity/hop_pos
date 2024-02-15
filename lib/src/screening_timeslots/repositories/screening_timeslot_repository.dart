import 'package:drift/drift.dart';
import 'package:hop_pos/app/app_db.dart';
import 'package:hop_pos/src/screening_timeslots/daos/screening_timeslot_dao.dart';
import 'package:hop_pos/src/screening_timeslots/models/screening_timeslot.dart';
import 'package:hop_pos/src/screening_timeslots/models/screening_timeslot_with_venue.dart';
import 'package:hop_pos/src/screenings/models/screening.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'screening_timeslot_repository.g.dart';

@riverpod
ScreeningTimeslotRepository screeningTimeslotRepo(ScreeningTimeslotRepoRef ref) {
  return ScreeningTimeslotRepository(
    screeningTimeslotDao: ref.watch(appDbProvider.select((prov) => prov.screeningTimeslotDao)),
  );
}

class ScreeningTimeslotRepository {
  final ScreeningTimeslotDao screeningTimeslotDao;

  ScreeningTimeslotRepository({
    required this.screeningTimeslotDao,
  });

  Future<List<ScreeningTimeslotWithVenue>> getScreeningTimeslotsWithVenue(Screening screening,
      {int page = 1, int size = 20}) async {
    return await screeningTimeslotDao.getScreeningTimeslotsWithVenue(screening, page: page, size: size);
  }

  Future<List<ScreeningTimeslot>> getScreeningTimeslots(Screening screening) async {
    return await screeningTimeslotDao.getScreeningTimeslots(screening);
  }

  Future<int> getScreeningTimeslotsCount(Screening screening) async {
    return await screeningTimeslotDao.getScreeningTimeslotsCount(screening);
  }

  Future<ScreeningTimeslot> insert(ScreeningTimeslotsTableCompanion timeslot) async {
    return await screeningTimeslotDao.insertScreeningTimeslot(timeslot);
  }

  Future<List<ScreeningTimeslot>> insertMany(List<ScreeningTimeslotsTableCompanion> timeslots) async {
    return await screeningTimeslotDao.insertScreeningTimeslots(timeslots);
  }

  Future<bool> update(ScreeningTimeslotsTableCompanion timeslot, Expression<bool> where) async {
    return await screeningTimeslotDao.updateScreeningTimeslot(timeslot, where);
  }

  Future<ScreeningTimeslot?> getById(int id) async {
    return await screeningTimeslotDao.getById(id);
  }
}
