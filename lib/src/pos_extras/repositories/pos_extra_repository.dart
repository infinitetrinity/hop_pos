import 'package:drift/drift.dart';
import 'package:hop_pos/app/app_db.dart';
import 'package:hop_pos/src/pos_extras/daos/pos_extra_dao.dart';
import 'package:hop_pos/src/pos_extras/models/pos_extra.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'pos_extra_repository.g.dart';

@riverpod
PosExtraRepository posExtraRepo(PosExtraRepoRef ref) {
  return PosExtraRepository(
    posExtraDao: ref.watch(appDbProvider.select((prov) => prov.posExtraDao)),
  );
}

class PosExtraRepository {
  final PosExtraDao posExtraDao;

  PosExtraRepository({
    required this.posExtraDao,
  });

  Future<List<PosExtra>> getAll() async {
    return await posExtraDao.getAll();
  }

  Future<PosExtra> insert(PosExtrasTableCompanion extra) async {
    return await posExtraDao.insertExtra(extra);
  }

  Future<List<PosExtra>> insertMany(List<PosExtrasTableCompanion> extras) async {
    return await posExtraDao.insertExtras(extras);
  }

  Future<bool> update(PosExtrasTableCompanion extra, Expression<bool> where) async {
    return await posExtraDao.updateExtra(extra, where);
  }
}
