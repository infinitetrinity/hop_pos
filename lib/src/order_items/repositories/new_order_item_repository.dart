import 'package:drift/drift.dart';
import 'package:hop_pos/app/app_db.dart';
import 'package:hop_pos/src/order_items/daos/new_order_item_dao.dart';
import 'package:hop_pos/src/order_items/models/order_item.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'new_order_item_repository.g.dart';

@riverpod
NewOrderItemRepository newOrderItemRepo(NewOrderItemRepoRef ref) {
  return NewOrderItemRepository(
    db: ref.watch(appDbProvider),
    newOrderItemDao: ref.watch(appDbProvider.select((prov) => prov.newOrderItemDao)),
  );
}

class NewOrderItemRepository {
  final AppDb db;
  final NewOrderItemDao newOrderItemDao;

  NewOrderItemRepository({
    required this.db,
    required this.newOrderItemDao,
  });

  Future<OrderItem> insert(NewOrderItemsTableCompanion item) async {
    return await newOrderItemDao.insertOrderItem(item);
  }

  Future<bool> delete(OrderItem item, {Expression<bool>? where}) async {
    return await newOrderItemDao.deleteOrderItem(item, where ?? db.newOrderItemsTable.id.equals(item.id!));
  }
}
