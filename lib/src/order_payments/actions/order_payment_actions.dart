import 'package:hop_pos/src/order_payments/models/order_payment.dart';
import 'package:hop_pos/src/order_payments/repositories/new_order_payment_repository.dart';
import 'package:hop_pos/src/order_payments/repositories/order_payment_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'order_payment_actions.g.dart';

@riverpod
OrderPaymentActions orderPaymentActions(OrderPaymentActionsRef ref) {
  return OrderPaymentActions(
    orderPaymentRepo: ref.watch(orderPaymentRepoProvider),
    newOrderPaymentRepo: ref.watch(newOrderPaymentRepoProvider),
  );
}

class OrderPaymentActions {
  final OrderPaymentRepository orderPaymentRepo;
  final NewOrderPaymentRepository newOrderPaymentRepo;

  OrderPaymentActions({
    required this.orderPaymentRepo,
    required this.newOrderPaymentRepo,
  });

  Future<OrderPayment> store(OrderPayment payment) async {
    return await newOrderPaymentRepo.insert(payment.toData());
  }

  Future<bool> delete(OrderPayment payment) async {
    final dynamic repo = payment.isNew == true ? newOrderPaymentRepo : orderPaymentRepo;
    return await repo.delete(payment);
  }
}
