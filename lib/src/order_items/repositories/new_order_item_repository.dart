import 'package:hop_pos/app/app_db.dart';
import 'package:hop_pos/src/order_items/daos/new_order_item_dao.dart';
import 'package:hop_pos/src/order_items/models/order_item.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'new_order_item_repository.g.dart';

@riverpod
NewOrderItemRepository newOrderItemRepo(NewOrderItemRepoRef ref) {
  return NewOrderItemRepository(
    newOrderItemDao: ref.watch(appDbProvider.select((prov) => prov.newOrderItemDao)),
  );
}

class NewOrderItemRepository {
  final NewOrderItemDao newOrderItemDao;

  NewOrderItemRepository({
    required this.newOrderItemDao,
  });

  Future<OrderItem> insert(NewOrderItemsTableCompanion item) async {
    return await newOrderItemDao.insertOrderItem(item);
  }

  Future<bool> delete(OrderItem item) async {
    return await newOrderItemDao.deleteOrderItem(item);
  }

  Future<bool> update(OrderItem item) async {
    return await newOrderItemDao.updateOrderItem(item);
  }

  Future<List<OrderItem>> getAll() async {
    return newOrderItemDao.getAll();
  }
}
