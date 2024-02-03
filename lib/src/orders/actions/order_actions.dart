import 'package:hop_pos/src/customers/models/customer.dart';
import 'package:hop_pos/src/orders/models/pos_order.dart';
import 'package:hop_pos/src/orders/repositories/new_order_repository.dart';
import 'package:hop_pos/src/orders/repositories/order_repository.dart';
import 'package:hop_pos/src/screenings/models/screening.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'order_actions.g.dart';

@riverpod
class OrderActions extends _$OrderActions {
  @override
  void build() {
    return;
  }

  Future<PosOrder?> getScreeningCustomerLatestOrder(Screening screening, Customer customer) async {
    final order = await ref.read(orderRepoProvider).getScreeningCustomerLatestOrder(screening, customer);
    final newOrder = await ref.read(newOrderRepoProvider).getScreeningCustomerLatestOrder(screening, customer);

    if (order != null && newOrder != null) {
      return order.order.createdAt!.isAfter(newOrder.order.createdAt!) ? order : newOrder;
    }

    return order ?? newOrder;
  }
}
