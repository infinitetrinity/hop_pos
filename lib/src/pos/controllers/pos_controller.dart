import 'package:hop_pos/src/common/services/flash_message.dart';
import 'package:hop_pos/src/customers/models/customer.dart';
import 'package:hop_pos/src/customers/models/customer_form.dart';
import 'package:hop_pos/src/order_extras/actions/order_extra_actions.dart';
import 'package:hop_pos/src/order_extras/models/order_extra.dart';
import 'package:hop_pos/src/order_items/models/order_item.dart';
import 'package:hop_pos/src/order_items/models/order_item_form.dart';
import 'package:hop_pos/src/order_payments/models/order_payment.dart';
import 'package:hop_pos/src/orders/actions/order_actions.dart';
import 'package:hop_pos/src/orders/models/order.dart';
import 'package:hop_pos/src/orders/models/order_discount_form.dart';
import 'package:hop_pos/src/orders/models/pos_order.dart';
import 'package:hop_pos/src/pos/models/pos_cart.dart';
import 'package:hop_pos/src/products/models/product.dart';
import 'package:hop_pos/src/screening_registrations/actions/screening_registration_actions.dart';
import 'package:hop_pos/src/screening_registrations/models/screening_registration.dart';
import 'package:hop_pos/src/screenings/models/screening.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'pos_controller.g.dart';

@riverpod
class PosController extends _$PosController {
  @override
  PosCart build() {
    return const PosCart();
  }

  void setScreening(Screening screening) {
    state = state.copyWith(screening: screening);
  }

  FutureOr<void> selectCustomer({required Customer customer, ScreeningRegistration? registration}) async {
    if (state.screening == null) {
      return;
    }

    registration ??=
        await ref.read(screeningRegistrationActionsProvider).findByCustomerAndScreening(state.screening!, customer);

    PosOrder order = await ref.read(orderActionsProvider).getScreeningCustomerLatestOrder(state.screening!, customer) ??
        const PosOrder(order: Order(isNew: true));

    List<OrderExtra>? extras = await ref.read(orderExtraActionsProvider).getOrderExtras(order);

    state = state.copyWith(
      customer: customer,
      registration: registration?.copyWith(hasOrders: order.order.id != null),
      order: order.copyWith(extras: extras),
    );
  }

  Future<void> addNewCustomer(CustomerForm data) async {
    final customer = Customer.fromJson(data.toJson());
    const order = PosOrder(order: Order(isNew: true));
    List<OrderExtra>? extras = await ref.read(orderExtraActionsProvider).getOrderExtras(order);

    state = state.copyWith(
      customer: customer,
      registration: null,
      order: order.copyWith(extras: extras),
    );
  }

  void updateCustomer(CustomerForm data) {
    state = state.copyWith(
      customer: Customer.fromJson(data.toJson()),
    );
  }

  Future<int?> getCustomersCount() async {
    if (state.screening == null) {
      return null;
    }

    return await ref.watch(screeningRegistrationActionsProvider).getCustomersCount(state.screening!);
  }

  void setSalesNote(String note) {
    if (state.order != null) {
      state = state.copyWith(
        order: state.order!.copyWith(
          order: state.order!.order.copyWith(salesNote: note),
        ),
      );
    }
  }

  Future<void> discardSales() async {
    if (state.order == null) {
      ref.read(flashMessageProvider).flash(message: 'Invalid order.', type: FlashMessageType.error);
      return;
    }

    await ref.read(orderActionsProvider).deleteOrder(state.order!.order);

    state = state.copyWith(
      customer: null,
      registration: null,
      order: null,
    );
  }

  Future<void> addProduct(dynamic product) async {
    if (state.customer == null) {
      ref.read(flashMessageProvider).flash(message: 'Please select a customer first.', type: FlashMessageType.error);
      return;
    }

    if (state.order == null) {
      ref.read(flashMessageProvider).flash(message: 'Invalid order.', type: FlashMessageType.error);
      return;
    }

    if (product is OrderItemForm) {
      product = Product.fromJson(product.toJson());
    }

    final order = await ref.read(orderActionsProvider).addProductToOrder(state.order!, product);
    state = state.copyWith(order: order);
  }

  Future<void> updateOrderItem(OrderItemForm form) async {
    if (state.customer == null) {
      ref.read(flashMessageProvider).flash(message: 'Please select a customer first.', type: FlashMessageType.error);
      return;
    }

    if (state.order == null) {
      ref.read(flashMessageProvider).flash(message: 'Invalid order.', type: FlashMessageType.error);
      return;
    }

    final order = await ref.read(orderActionsProvider).updateOrderItem(state.order!, OrderItem.fromJson(form.toJson()));
    state = state.copyWith(order: order);
  }

  Future<void> deleteOrderItem(OrderItem item) async {
    if (state.order == null) {
      ref.read(flashMessageProvider).flash(message: 'Invalid order.', type: FlashMessageType.error);
      return;
    }

    final balance = state.order?.balance ?? 0;

    if ((balance - (item.netPrice ?? 0)) < 0) {
      ref
          .read(flashMessageProvider)
          .flash(message: 'Cannot remove product, balance cannot be lesser than 0.', type: FlashMessageType.error);
      return;
    }

    final order = await ref.read(orderActionsProvider).deleteOrderItem(state.order!, item);
    state = state.copyWith(order: order);
  }

  Future<void> setUTF({bool isUtf = true}) async {
    if (state.order == null || state.order?.order.isUtf == isUtf) {
      return;
    }

    state = state.copyWith(
      order: state.order!.copyWith(
        order: state.order!.order.copyWith(
          isUtf: isUtf,
        ),
      ),
    );

    await ref.read(orderActionsProvider).updateOrder(state.order!);
  }

  Future<void> setSTF({bool isStf = true}) async {
    if (state.order == null || state.order?.order.isStf == isStf) {
      return;
    }

    state = state.copyWith(
      order: state.order!.copyWith(
        order: state.order!.order.copyWith(
          isStf: isStf,
        ),
      ),
    );

    await ref.read(orderActionsProvider).updateOrder(state.order!);
  }

  Future<void> deleteOrderPayment(OrderPayment payment) async {
    if (state.order == null) {
      ref.read(flashMessageProvider).flash(message: 'Invalid order.', type: FlashMessageType.error);
      return;
    }

    final order = await ref.read(orderActionsProvider).deleteOrderPayment(state.order!, payment);
    state = state.copyWith(order: order);
  }

  Future<void> checkout() async {
    if (state.customer == null) {
      ref.read(flashMessageProvider).flash(message: 'Please select a customer.', type: FlashMessageType.error);
      return;
    }

    if (state.order == null) {
      ref.read(flashMessageProvider).flash(message: 'Invalid order.', type: FlashMessageType.error);
      return;
    }

    if ((state.order!.items?.length ?? 0) <= 0) {
      ref
          .read(flashMessageProvider)
          .flash(message: 'Please add at least 1 product into the cart', type: FlashMessageType.error);
      return;
    }

    if (state.order!.balance < 0) {
      ref
          .read(flashMessageProvider)
          .flash(message: 'Amount payable cannot be lesser than 0.', type: FlashMessageType.error);
      return;
    }

    state = await ref.read(orderActionsProvider).checkout(state);
  }

  Future<void> setDiscount(OrderDiscountForm form) async {
    if (state.order == null) {
      return;
    }

    state = state.copyWith(
      order: state.order!.copyWith(
        order: state.order!.order.copyWith(
          discount: form.discount,
          discountType: form.discountType,
        ),
      ),
    );

    final order = await ref.read(orderActionsProvider).updateOrder(state.order!);
    state = state.copyWith(order: order);
  }
}
