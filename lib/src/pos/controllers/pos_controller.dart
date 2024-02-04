import 'package:hop_pos/src/common/services/flash_message.dart';
import 'package:hop_pos/src/customers/models/customer.dart';
import 'package:hop_pos/src/customers/models/customer_form.dart';
import 'package:hop_pos/src/order_extras/actions/order_extra_actions.dart';
import 'package:hop_pos/src/order_extras/models/order_extra.dart';
import 'package:hop_pos/src/orders/actions/order_actions.dart';
import 'package:hop_pos/src/orders/models/order.dart';
import 'package:hop_pos/src/orders/models/pos_order.dart';
import 'package:hop_pos/src/pos/models/pos_cart.dart';
import 'package:hop_pos/src/products/models/product.dart';
import 'package:hop_pos/src/products/models/product_form.dart';
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

  void _reset() {
    state = state.copyWith(
      customer: null,
      registration: null,
      order: null,
    );
  }

  FutureOr<void> selectCustomer({
    required Customer customer,
    ScreeningRegistration? registration,
  }) async {
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

  void addNewCustomer(CustomerForm data) {
    final customer = Customer.fromJson(data.toJson());

    state = state.copyWith(
      customer: customer,
      registration: null,
      order: null,
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
    _reset();
  }

  Future<void> addProduct(Product product) async {
    if (state.customer == null) {
      ref.read(flashMessageProvider).flash(message: 'Please select a customer first.', type: FlashMessageType.error);
      return;
    }

    if (state.order == null) {
      ref.read(flashMessageProvider).flash(message: 'Invalid order.', type: FlashMessageType.error);
      return;
    }

    final order = await ref.read(orderActionsProvider).addProductToOrder(state.order!, product);
    state = state.copyWith(order: order);
  }

  Future<void> addNewProduct(ProductForm data) async {
    await addProduct(Product.fromJson(data.toJson()));
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
}
