import 'package:hop_pos/src/order_extras/models/order_extra.dart';
import 'package:hop_pos/src/orders/models/pos_order.dart';
import 'package:hop_pos/src/pos_extras/actions/pos_extra_actions.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'order_extra_actions.g.dart';

@riverpod
OrderExtraActions orderExtraActions(OrderExtraActionsRef ref) {
  return OrderExtraActions(
    posExtraActions: ref.watch(posExtraActionsProvider),
  );
}

class OrderExtraActions {
  final PosExtraActions posExtraActions;

  OrderExtraActions({
    required this.posExtraActions,
  });

  Future<List<OrderExtra>?> getOrderExtras(PosOrder order) async {
    List<OrderExtra>? extras = order.extras;

    extras ??= await posExtraActions.getAllExtras().then(
          (extras) => extras
              .map(
                (extra) => OrderExtra.fromJson(extra.toJson()).copyWith(
                  orderIsNew: order.order.isNew,
                  isNew: true,
                  orderId: order.order.id,
                  calculatedAmount: extra.calculateAmount(order.subtotal),
                ),
              )
              .toList(),
        );

    return extras;
  }
}
