import 'package:hop_pos/src/customers/models/customer.dart';
import 'package:hop_pos/src/orders/models/pos_order.dart';
import 'package:hop_pos/src/orders/repositories/new_order_repository.dart';
import 'package:hop_pos/src/orders/repositories/order_repository.dart';
import 'package:hop_pos/src/screenings/models/screening.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'order_actions.g.dart';

@riverpod
OrderActions orderActions(OrderActionsRef ref) {
  return OrderActions(
    orderRepo: ref.watch(orderRepoProvider),
    newOrderRepo: ref.watch(newOrderRepoProvider),
  );
}

class OrderActions {
  final OrderRepository orderRepo;
  final NewOrderRepository newOrderRepo;

  OrderActions({
    required this.orderRepo,
    required this.newOrderRepo,
  });

  Future<PosOrder?> getScreeningCustomerLatestOrder(Screening screening, Customer customer) async {
    final order = await orderRepo.getScreeningCustomerLatestOrder(screening, customer);
    final newOrder = await newOrderRepo.getScreeningCustomerLatestOrder(screening, customer);

    if (order != null && newOrder != null) {
      return order.order.createdAt!.isAfter(newOrder.order.createdAt!) ? order : newOrder;
    }

    return newOrder ?? order;
  }
}
