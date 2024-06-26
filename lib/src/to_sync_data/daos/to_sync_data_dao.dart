import 'package:drift/drift.dart';
import 'package:hop_pos/app/app_db.dart';
import 'package:hop_pos/src/to_sync_data/models/to_sync_data.dart';
import 'package:hop_pos/src/to_sync_data/models/to_sync_data_table.dart';

part 'to_sync_data_dao.g.dart';

@DriftAccessor(tables: [
  ToSyncDataTable,
])
class ToSycnDataDao extends DatabaseAccessor<AppDb> with _$ToSycnDataDaoMixin {
  ToSycnDataDao(AppDb db) : super(db);

  Future<ToSyncData> insertToSyncData(ToSyncDataTableCompanion data) async {
    return await transaction(() async {
      await deleteDuplicate(data);
      return await into(toSyncDataTable).insertReturning(data);
    });
  }

  Future<bool> deleteDuplicate(ToSyncDataTableCompanion data) async {
    final count = await (delete(toSyncDataTable)
          ..where((tbl) => tbl.model.equals(data.model.value.name))
          ..where((tbl) => tbl.modelId.equals(data.modelId.value))
          ..where((tbl) => tbl.action.equals(data.action.value.name)))
        .go();
    return count > 0;
  }

  Future<List<ToSyncData>> getAll() {
    final query = select(toSyncDataTable);

    query.orderBy([(table) => OrderingTerm.asc(table.id)]);
    return query.get();
  }

  Future<bool> deleteByIds(List<int> ids) async {
    final count = await (delete(toSyncDataTable)..where((tbl) => tbl.id.isIn(ids))).go();
    return count > 0;
  }
}
