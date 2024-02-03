import 'package:hop_pos/src/order_items/repositories/new_order_item_repository.dart';
import 'package:hop_pos/src/orders/models/pos_order.dart';
import 'package:hop_pos/src/products/models/product.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'pos_actions.g.dart';

@riverpod
class PosActions extends _$PosActions {
  @override
  void build() {
    return;
  }

  Future<PosOrder> addProduct(PosOrder order, Product product) async {
    final items = (order.items ?? []);
    final newItem = product.toOrderItem.copyWith(
      productId: product.id,
      cartId: items.length + 1,
      orderIsNew: order.order.isNew,
      orderId: order.order.id,
    );

    final updatedOrder = order.copyWith(
        items: [...items, newItem],
        order: order.order.copyWith(
          subtotal: order.subtotal,
        ));

    if (updatedOrder.order.id != null) {
      await ref.read(newOrderItemRepoProvider).insert(newItem.toData);

      // order.order.isNew
      //     ? await ref.read(newOrderRepoProvider).update(item.toData)
      //     : await ref.read(newOrderItemRepoProvider).insert(item.toData);
    }

    //update order
    //update order extra

    return updatedOrder;
  }
}
