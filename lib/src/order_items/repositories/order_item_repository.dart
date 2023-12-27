import 'package:drift/drift.dart';
import 'package:hop_pos/app/app_db.dart';
import 'package:hop_pos/src/order_items/daos/order_item_dao.dart';
import 'package:hop_pos/src/order_items/models/order_item.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'order_item_repository.g.dart';

@riverpod
OrderItemRepository orderItemRepo(OrderItemRepoRef ref) {
  return OrderItemRepository(
    orderItemDao: ref.watch(appDbProvider.select((prov) => prov.orderItemDao)),
  );
}

class OrderItemRepository {
  final OrderItemDao orderItemDao;

  OrderItemRepository({
    required this.orderItemDao,
  });

  Future<OrderItem> insert(OrderItemsTableCompanion item) async {
    return await orderItemDao.insertOrderItem(item);
  }

  Future<List<OrderItem>> insertMany(List<OrderItemsTableCompanion> items) async {
    return await orderItemDao.insertOrderItems(items);
  }

  Future<bool> update(OrderItemsTableCompanion item, Expression<bool> where) async {
    return await orderItemDao.updateOrderItem(item, where);
  }
}
