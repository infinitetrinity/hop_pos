import 'package:hop_pos/app/app_db.dart';
import 'package:hop_pos/src/to_sync_data/daos/to_sync_data_dao.dart';
import 'package:hop_pos/src/to_sync_data/models/to_sync_data.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'to_sync_data_repo.g.dart';

@riverpod
ToSyncDataRepository toSyncDataRepo(ToSyncDataRepoRef ref) {
  return ToSyncDataRepository(
    toSyncDataDao: ref.watch(appDbProvider.select((prov) => prov.toSycnDataDao)),
  );
}

class ToSyncDataRepository {
  final ToSycnDataDao toSyncDataDao;

  ToSyncDataRepository({
    required this.toSyncDataDao,
  });

  Future<List<ToSyncData>> getAll() async {
    return await toSyncDataDao.getAll();
  }
}
