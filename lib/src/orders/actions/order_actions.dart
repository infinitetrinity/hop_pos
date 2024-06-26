import 'dart:math';

import 'package:hop_pos/src/customers/actions/customer_actions.dart';
import 'package:hop_pos/src/customers/models/customer.dart';
import 'package:hop_pos/src/order_extras/actions/order_extra_actions.dart';
import 'package:hop_pos/src/order_items/actions/order_item_actions.dart';
import 'package:hop_pos/src/order_items/models/order_item.dart';
import 'package:hop_pos/src/order_payments/actions/order_payment_actions.dart';
import 'package:hop_pos/src/order_payments/models/order_payment.dart';
import 'package:hop_pos/src/order_payments/models/order_payment_with_method.dart';
import 'package:hop_pos/src/orders/models/order.dart';
import 'package:hop_pos/src/orders/models/order_with_customer_and_payment.dart';
import 'package:hop_pos/src/orders/models/pos_order.dart';
import 'package:hop_pos/src/orders/repositories/new_order_repository.dart';
import 'package:hop_pos/src/orders/repositories/order_repository.dart';
import 'package:hop_pos/src/payment_methods/models/payment_method.dart';
import 'package:hop_pos/src/pos/models/pos_cart.dart';
import 'package:hop_pos/src/pos_licenses/actions/pos_license_actions.dart';
import 'package:hop_pos/src/pos_licenses/models/pos_license.dart';
import 'package:hop_pos/src/products/models/product.dart';
import 'package:hop_pos/src/screening_registrations/actions/screening_registration_actions.dart';
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
    orderPaymentActions: ref.watch(orderPaymentActionsProvider),
    customerActions: ref.watch(customerActionsProvider),
    screeningRegistrationActions: ref.watch(screeningRegistrationActionsProvider),
    posLicenseActions: ref.watch(posLicenseActionsProvider),
  );
}

class OrderActions {
  final OrderRepository orderRepo;
  final NewOrderRepository newOrderRepo;
  final OrderExtraActions orderExtraActions;
  final OrderItemActions orderItemActions;
  final OrderPaymentActions orderPaymentActions;
  final CustomerActions customerActions;
  final ScreeningRegistrationActions screeningRegistrationActions;
  final PosLicenseActions posLicenseActions;

  OrderActions({
    required this.orderRepo,
    required this.newOrderRepo,
    required this.orderExtraActions,
    required this.orderItemActions,
    required this.orderPaymentActions,
    required this.customerActions,
    required this.screeningRegistrationActions,
    required this.posLicenseActions,
  });

  Future<PosOrder?> getScreeningCustomerLatestOrder(Screening screening, Customer customer) async {
    final order = await orderRepo.getScreeningCustomerLatestOrder(screening, customer);
    final newOrder = await newOrderRepo.getScreeningCustomerLatestOrder(screening, customer);

    if (order != null && newOrder != null) {
      return order.order.createdAt!.isAfter(newOrder.order.createdAt!) ? order : newOrder;
    }

    return newOrder ?? order;
  }

  Future<PosOrder?> getPosOrder(Order order) async {
    return order.isNew ? await newOrderRepo.getPosOrder(order) : await orderRepo.getPosOrder(order);
  }

  Future<PosOrder> addProductToOrder(PosOrder order, Product product) async {
    final items = (order.items ?? []);
    OrderItem newItem = product.toOrderItem().copyWith(
          cartId: items.length + 1,
          orderIsNew: order.order.isNew,
          orderId: order.order.id,
        );

    if (order.order.id != null) {
      final createdItem = await orderItemActions.store(newItem);
      newItem = newItem.copyWith(id: createdItem.id);
    }

    order = order.copyWith(
      items: [...items, newItem],
    );

    return (await updateOrder(order));
  }

  Future<PosOrder> updateOrderItem(PosOrder order, OrderItem item) async {
    final items = (order.items ?? []);
    final updatedItem = item.copyWith(
      netPrice: item.toCalculateNetPrice(),
    );

    if (order.order.id != null) {
      await orderItemActions.update(updatedItem);
    }

    order = order.copyWith(
      items: items
          .map(
            (el) => (el.id == updatedItem.id && el.cartId == updatedItem.cartId && el.isNew == updatedItem.isNew)
                ? updatedItem
                : el,
          )
          .toList(),
    );

    return (await updateOrder(order));
  }

  Future<PosOrder> deleteOrderItem(PosOrder order, OrderItem item) async {
    if (order.order.id != null) {
      await orderItemActions.delete(item);
    }

    order = order.copyWith(
      items: ([...order.items ?? []])
        ..removeWhere(
          (el) => el.cartId == item.cartId && el.id == item.id && el.isNew == item.isNew,
        ),
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

  Future<void> deleteOrder(Order order) async {
    if (order.id == null) {
      return;
    }

    final dynamic repo = order.isNew == true ? newOrderRepo : orderRepo;
    await repo.delete(order);
  }

  Future<PosOrder> createNewOrderWithItemsAndExtras(PosOrder order) async {
    return newOrderRepo.storeWithItemsAndExtras(order);
  }

  Future<PosOrder> createNewOrderPayment(PosOrder order, PaymentMethod method, double amount) async {
    final payment = OrderPayment(
      orderId: order.order.id!,
      paymentMethodId: method.id,
      amount: amount,
      isNew: true,
      orderIsNew: order.order.isNew,
    );

    final result = await orderPaymentActions.store(payment);

    return order.copyWith(
      payments: [
        ...order.payments ?? [],
        OrderPaymentWithMethod(
          payment: result,
          method: method,
        )
      ],
    );
  }

  Future<PosOrder> deleteOrderPayment(PosOrder order, OrderPayment payment) async {
    if (order.order.id != null) {
      await orderPaymentActions.delete(payment);
    }

    order = order.copyWith(
      payments: ([...order.payments ?? []])
        ..removeWhere(
          (el) => el.payment.id == payment.id && el.payment.isNew == payment.isNew,
        ),
    );

    return order;
  }

  Future<String> getNewOrderInvoiceNo(PosLicense? license) async {
    final lastOrderNo = await orderRepo.getLastInvoiceNo(license?.invoicePrefix ?? '');
    final lastNewOrderNo = await newOrderRepo.getLastInvoiceNo();
    final newOrderNo = (max(lastNewOrderNo, lastOrderNo) + 1).toString();

    return newOrderNo.padLeft(4, '0');
  }

  Future<PosCart> checkout(PosCart cart) async {
    if (cart.order!.order.id != null) {
      final order = await updateOrder(cart.order!);
      return cart.copyWith(order: order);
    }

    if (cart.customer!.id == null) {
      final customer = await customerActions.store(cart.customer!);
      cart = cart.copyWith(customer: customer);
    }

    if (cart.registration == null) {
      final registraion =
          await screeningRegistrationActions.insertNewScreeningRegistration(cart.screening!, cart.customer!);
      cart = cart.copyWith(registration: registraion);
    }

    final posLicense = await posLicenseActions.getFirst();
    final invoiceNo = await getNewOrderInvoiceNo(posLicense);

    final order = await createNewOrderWithItemsAndExtras(
      cart.order!.copyWith(
        order: cart.order!.order.copyWith(
          invoiceNo: invoiceNo,
          invoicePrefix: posLicense?.invoicePrefix,
          screeningId: cart.screening!.id,
          customerNric: cart.customer!.nric,
        ),
      ),
    );

    return cart.copyWith(
      order: order,
      registration: cart.registration?.copyWith(hasOrders: true),
    );
  }

  Future<List<OrderWithCustomerAndPayment>> getIncompleteOrdersWithinDays({
    int days = 30,
    int page = 1,
    int size = 20,
    String? search,
  }) async {
    final orders = await orderRepo.getIncompleteOrdersWithinDays(days, search: search);
    final newOrders = await newOrderRepo.getIncompleteOrdersWithinDays(days, search: search);

    final sorted = [...orders, ...newOrders]..sort((a, b) => b.order.createdAt!.compareTo(a.order.createdAt!));

    final start = size * (page - 1);
    final end = start + size > sorted.length ? sorted.length : start + size;
    return sorted.sublist(start, end).toList();
  }

  Future<int> getIncompleteOrdersWithinDaysCount({int days = 30, String? search}) async {
    final orderCount = await orderRepo.getIncompleteOrdersWithinDaysCount(days, search: search);
    final newOrderCount = await newOrderRepo.getIncompleteOrdersWithinDaysCount(days, search: search);

    return orderCount + newOrderCount;
  }

  Future<List<Order>> getAllNew() async {
    return newOrderRepo.getAll();
  }
}
