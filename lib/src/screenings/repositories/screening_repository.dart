import 'package:drift/drift.dart';
import 'package:hop_pos/app/app_db.dart';
import 'package:hop_pos/src/screenings/daos/screening_dao.dart';
import 'package:hop_pos/src/screenings/models/screening.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'screening_repository.g.dart';

@riverpod
ScreeningRepository screeningRepo(ScreeningRepoRef ref) {
  return ScreeningRepository(
    screeningDao: ref.watch(appDbProvider.select((prov) => prov.screeningDao)),
  );
}

class ScreeningRepository {
  final ScreeningDao screeningDao;

  ScreeningRepository({
    required this.screeningDao,
  });

  Future<Screening> insert(ScreeningsTableCompanion screening) async {
    return await screeningDao.insertScreening(screening);
  }

  Future<List<Screening>> insertMany(
      List<ScreeningsTableCompanion> screenings) async {
    return await screeningDao.insertScreenings(screenings);
  }

  Future<bool> update(
      ScreeningsTableCompanion screening, Expression<bool> where) async {
    return await screeningDao.updateScreening(screening, where);
  }
}
