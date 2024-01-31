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

  FutureOr<void> selectCustomer({
    required Customer customer,
    ScreeningRegistration? registration,
  }) async {
    if (registration == null && state.screening != null) {
      registration = await ref
          .read(screeningRegistrationActionsProvider.notifier)
          .findByCustomerAndScreening(state.screening!, customer);
    }

    List<PosOrder>? orders;
    if (registration != null && state.screening != null) {
      orders = await ref.read(orderActionsProvider.notifier).getScreeningCustomerOrders(state.screening!, customer);
      print('orders $orders');
    }

    state = state.copyWith(
      customer: customer,
      registration: registration,
      orders: orders,
    );
  }

  void addNewCustomer(CustomerForm data) {
    state = state.copyWith(
      customer: Customer.fromJson(data.toJson()),
      registration: null,
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
    state = state.copyWith(
      salesNote: note,
    );
  }
}
