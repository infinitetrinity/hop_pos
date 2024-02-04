import 'package:drift/drift.dart';
import 'package:hop_pos/app/app_db.dart';
import 'package:hop_pos/src/pos_extras/models/pos_extra.dart';
import 'package:hop_pos/src/pos_extras/models/pos_extras_table.dart';

part 'pos_extra_dao.g.dart';

@DriftAccessor(tables: [PosExtrasTable])
class PosExtraDao extends DatabaseAccessor<AppDb> with _$PosExtraDaoMixin {
  PosExtraDao(AppDb db) : super(db);

  Future<List<PosExtra>> getAll() {
    final query = select(posExtrasTable);

    query.orderBy([(table) => OrderingTerm.asc(table.id)]);
    return query.get();
  }

  Future<PosExtra> insertExtra(PosExtrasTableCompanion extra) async {
    return await into(posExtrasTable).insertReturning(extra);
  }

  Future<List<PosExtra>> insertExtras(List<PosExtrasTableCompanion> extras) async {
    return await transaction(() async {
      List<Future<PosExtra>> insertFutures = [];

      for (PosExtrasTableCompanion extra in extras) {
        insertFutures.add(insertExtra(extra));
      }

      List<PosExtra> result = await Future.wait(insertFutures);
      return result;
    });
  }

  Future<bool> updateExtra(PosExtrasTableCompanion extra, Expression<bool> where) async {
    final count = await (update(posExtrasTable)..where((_) => where)).write(extra);
    return count > 0;
  }
}
