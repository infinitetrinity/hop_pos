import 'package:drift/drift.dart';
import 'package:hop_pos/app/app_db.dart';
import 'package:hop_pos/src/order_extras/daos/order_extra_dao.dart';
import 'package:hop_pos/src/order_extras/models/order_extra.dart';
import 'package:hop_pos/src/to_sync_data/daos/to_sync_data_dao.dart';
import 'package:hop_pos/src/to_sync_data/models/to_sync_data.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'order_extra_repository.g.dart';

@riverpod
OrderExtraRepository orderExtraRepo(OrderExtraRepoRef ref) {
  return OrderExtraRepository(
    db: ref.watch(appDbProvider),
    orderExtraDao: ref.watch(appDbProvider.select((prov) => prov.orderExtraDao)),
    toSycnDataDao: ref.watch(appDbProvider.select((prov) => prov.toSycnDataDao)),
  );
}

class OrderExtraRepository {
  final AppDb db;
  final OrderExtraDao orderExtraDao;
  final ToSycnDataDao toSycnDataDao;

  OrderExtraRepository({
    required this.db,
    required this.orderExtraDao,
    required this.toSycnDataDao,
  });

  Future<OrderExtra> insert(OrderExtrasTableCompanion extra) async {
    return await orderExtraDao.insertOrderExtra(extra);
  }

  Future<List<OrderExtra>> insertMany(List<OrderExtrasTableCompanion> extras) async {
    return await orderExtraDao.insertOrderExtras(extras);
  }

  Future<bool> update(OrderExtra extra, {Expression<bool>? where}) async {
    return await db.transaction(() async {
      final result =
          await orderExtraDao.updateOrderExtra(extra.toData(), where ?? db.orderExtrasTable.id.equals(extra.id!));

      await toSycnDataDao.insertToSyncData(extra.toSyncData(ToSyncActions.update));
      return result;
    });
  }
}
