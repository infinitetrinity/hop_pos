import 'package:hop_pos/src/customers/models/customer.dart';
import 'package:hop_pos/src/orders/models/pos_order.dart';
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

  Future<List<PosOrder>?> getScreeningCustomerOrders(Screening screening, Customer customer) async {
    final repo = ref.read(orderRepoProvider);
    final orders = await repo.getScreeningCustomerOrders(screening, customer);

    return orders;
  }
}
