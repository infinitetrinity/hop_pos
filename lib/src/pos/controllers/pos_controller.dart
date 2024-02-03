import 'package:hop_pos/src/common/services/flash_message.dart';
import 'package:hop_pos/src/customers/models/customer.dart';
import 'package:hop_pos/src/customers/models/customer_form.dart';
import 'package:hop_pos/src/orders/actions/order_actions.dart';
import 'package:hop_pos/src/orders/models/order.dart';
import 'package:hop_pos/src/orders/models/pos_order.dart';
import 'package:hop_pos/src/pos/actions/pos_actions.dart';
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
    if (registration == null && state.screening != null) {
      registration = await ref
          .read(screeningRegistrationActionsProvider.notifier)
          .findByCustomerAndScreening(state.screening!, customer);
    }

    PosOrder? order = registration == null || state.screening == null
        ? const PosOrder(order: Order(isNew: true))
        : await ref.read(orderActionsProvider.notifier).getScreeningCustomerLatestOrder(state.screening!, customer);

    state = state.copyWith(
      customer: customer,
      registration: registration?.copyWith(hasOrders: order != null),
      order: order,
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

    return await ref.watch(screeningRegistrationActionsProvider.notifier).getCustomersCount(state.screening!);
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

    final order = await ref.read(posActionsProvider.notifier).addProduct(state.order!, product);

    state = state.copyWith(order: order);
  }
}
