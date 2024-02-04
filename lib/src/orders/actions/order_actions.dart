import 'package:hop_pos/src/customers/models/customer.dart';
import 'package:hop_pos/src/order_extras/actions/order_extra_actions.dart';
import 'package:hop_pos/src/order_items/actions/order_item_actions.dart';
import 'package:hop_pos/src/orders/models/pos_order.dart';
import 'package:hop_pos/src/orders/repositories/new_order_repository.dart';
import 'package:hop_pos/src/orders/repositories/order_repository.dart';
import 'package:hop_pos/src/products/models/product.dart';
import 'package:hop_pos/src/screenings/models/screening.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'order_actions.g.dart';

@riverpod
OrderActions orderActions(OrderActionsRef ref) {
  return OrderActions(
    orderRepo: ref.watch(orderRepoProvider),
    newOrderRepo: ref.watch(newOrderRepoProvider),
    orderExtraActions: ref.watch(orderExtraActionsProvider),
    orderItemActions: ref.watch(orderItemActionsProvider),
  );
}

class OrderActions {
  final OrderRepository orderRepo;
  final NewOrderRepository newOrderRepo;
  final OrderExtraActions orderExtraActions;
  final OrderItemActions orderItemActions;

  OrderActions({
    required this.orderRepo,
    required this.newOrderRepo,
    required this.orderExtraActions,
    required this.orderItemActions,
  });

  Future<PosOrder?> getScreeningCustomerLatestOrder(Screening screening, Customer customer) async {
    final order = await orderRepo.getScreeningCustomerLatestOrder(screening, customer);
    final newOrder = await newOrderRepo.getScreeningCustomerLatestOrder(screening, customer);

    if (order != null && newOrder != null) {
      return order.order.createdAt!.isAfter(newOrder.order.createdAt!) ? order : newOrder;
    }

    return newOrder ?? order;
  }

  Future<PosOrder> addProductToOrder(PosOrder order, Product product) async {
    final items = (order.items ?? []);
    final newItem = product.toOrderItem.copyWith(
      productId: product.id,
      cartId: items.length + 1,
      orderIsNew: order.order.isNew,
      orderId: order.order.id,
      isNew: true,
    );

    if (order.order.id != null) {
      await orderItemActions.store(newItem);
    }

    order = order.copyWith(
      items: [...items, newItem],
    );

    return (await updateOrder(order));
  }

  Future<PosOrder> updateOrder(PosOrder order) async {
    order = order.copyWith(
      order: order.order.copyWith(
        subtotal: order.subtotal,
      ),
    );

    order = (await orderExtraActions.updateOrderExtras(order)).copyWith(
      order: order.order.copyWith(
        extrasTotal: order.extrasTotal,
        netTotal: order.totalBeforeRounding,
        rounding: order.rounding,
      ),
    );

    if (order.order.id != null) {
      final dynamic repo = order.order.isNew == true ? newOrderRepo : orderRepo;
      await repo.update(order.order);
    }

    return order;
  }
}
