import 'package:drift/drift.dart';
import 'package:hop_pos/app/app_db.dart';
import 'package:hop_pos/src/order_items/daos/order_item_dao.dart';
import 'package:hop_pos/src/order_items/models/order_item.dart';
import 'package:hop_pos/src/to_sync_data/daos/to_sync_data_dao.dart';
import 'package:hop_pos/src/to_sync_data/models/to_sync_data.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'order_item_repository.g.dart';

@riverpod
OrderItemRepository orderItemRepo(OrderItemRepoRef ref) {
  return OrderItemRepository(
    db: ref.watch(appDbProvider),
    orderItemDao: ref.watch(appDbProvider.select((prov) => prov.orderItemDao)),
    toSycnDataDao: ref.watch(appDbProvider.select((prov) => prov.toSycnDataDao)),
  );
}

class OrderItemRepository {
  final AppDb db;
  final OrderItemDao orderItemDao;
  final ToSycnDataDao toSycnDataDao;

  OrderItemRepository({
    required this.db,
    required this.orderItemDao,
    required this.toSycnDataDao,
  });

  Future<OrderItem> insert(OrderItemsTableCompanion item) async {
    return await orderItemDao.insertOrderItem(item);
  }

  Future<List<OrderItem>> insertMany(List<OrderItemsTableCompanion> items) async {
    return await orderItemDao.insertOrderItems(items);
  }

  Future<bool> delete(OrderItem item, {Expression<bool>? where}) async {
    return await db.transaction(() async {
      final result = await orderItemDao.deleteOrderItem(item, where ?? db.orderItemsTable.id.equals(item.id!));

      await toSycnDataDao.insertToSyncData(item.toSyncData(ToSyncActions.delete));
      return result;
    });
  }
}
