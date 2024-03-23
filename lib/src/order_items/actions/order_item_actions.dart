import 'package:hop_pos/src/order_items/models/order_item.dart';
import 'package:hop_pos/src/order_items/repositories/new_order_item_repository.dart';
import 'package:hop_pos/src/order_items/repositories/order_item_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'order_item_actions.g.dart';

@riverpod
OrderItemActions orderItemActions(OrderItemActionsRef ref) {
  return OrderItemActions(
    orderItemRepo: ref.watch(orderItemRepoProvider),
    newOrderItemRepo: ref.watch(newOrderItemRepoProvider),
  );
}

class OrderItemActions {
  final OrderItemRepository orderItemRepo;
  final NewOrderItemRepository newOrderItemRepo;

  OrderItemActions({
    required this.orderItemRepo,
    required this.newOrderItemRepo,
  });

  Future<OrderItem> store(OrderItem item) async {
    final dynamic repo = item.isNew == true ? newOrderItemRepo : orderItemRepo;
    return await repo.insert(item.toData());
  }

  Future<bool> delete(OrderItem item) async {
    final dynamic repo = item.isNew == true ? newOrderItemRepo : orderItemRepo;
    return await repo.delete(item);
  }

  Future<bool> update(OrderItem item) async {
    final dynamic repo = item.isNew == true ? newOrderItemRepo : orderItemRepo;
    return await repo.update(item);
  }

  Future<List<OrderItem>> getAllNew() async {
    return newOrderItemRepo.getAll();
  }
}
