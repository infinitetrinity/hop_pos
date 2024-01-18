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

  Future<List<Screening>> getUpcoming() {
    return screeningDao.getUpcoming();
  }

  Future<List<Screening>> search(String search) {
    return screeningDao.search(search);
  }
}
