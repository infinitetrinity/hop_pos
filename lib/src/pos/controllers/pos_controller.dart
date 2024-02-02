import 'package:hop_pos/src/customers/models/customer.dart';
import 'package:hop_pos/src/customers/models/customer_form.dart';
import 'package:hop_pos/src/orders/actions/order_actions.dart';
import 'package:hop_pos/src/orders/models/pos_order.dart';
import 'package:hop_pos/src/pos/models/pos_cart.dart';
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

  void reset() {
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
        ? null
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
}
