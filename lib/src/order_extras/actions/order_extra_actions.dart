import 'package:hop_pos/src/order_extras/models/order_extra.dart';
import 'package:hop_pos/src/order_extras/repositories/new_order_extra_repository.dart';
import 'package:hop_pos/src/order_extras/repositories/order_extra_repository.dart';
import 'package:hop_pos/src/orders/models/pos_order.dart';
import 'package:hop_pos/src/pos_extras/actions/pos_extra_actions.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'order_extra_actions.g.dart';

@riverpod
OrderExtraActions orderExtraActions(OrderExtraActionsRef ref) {
  return OrderExtraActions(
    orderExtraRepo: ref.watch(orderExtraRepoProvider),
    newOrderExtraRepo: ref.watch(newOrderExtraRepoProvider),
    posExtraActions: ref.watch(posExtraActionsProvider),
  );
}

class OrderExtraActions {
  final OrderExtraRepository orderExtraRepo;
  final NewOrderExtraRepository newOrderExtraRepo;
  final PosExtraActions posExtraActions;

  OrderExtraActions({
    required this.orderExtraRepo,
    required this.newOrderExtraRepo,
    required this.posExtraActions,
  });

  Future<List<OrderExtra>?> getOrderExtras(PosOrder order) async {
    List<OrderExtra>? extras = order.extras;

    if (order.order.isNew && extras == null) {
      extras = await posExtraActions.getAllExtras().then(
            (extras) => extras
                .map(
                  (extra) => OrderExtra.fromJson(extra.toJson()).copyWith(
                    id: null,
                    extraId: extra.id,
                    orderIsNew: true,
                    isNew: true,
                    orderId: order.order.id,
                  ),
                )
                .toList(),
          );
    }

    return extras
        ?.map(
          (extra) => extra.copyWith(
            calculatedAmount: extra.toCalculateAmount(order.subtotalAfterDiscount),
          ),
        )
        .toList();
  }

  Future<PosOrder> updateOrderExtras(PosOrder order) async {
    List<OrderExtra>? updatedExtras = await getOrderExtras(order);

    if (!order.order.isNew && updatedExtras != null) {
      for (final extra in updatedExtras) {
        final dynamic repo = extra.isNew == true ? newOrderExtraRepo : orderExtraRepo;
        await repo.update(extra);
      }
    }

    return order.copyWith(extras: updatedExtras);
  }
}
