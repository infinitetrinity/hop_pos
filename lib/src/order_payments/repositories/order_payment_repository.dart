import 'package:hop_pos/app/app_db.dart';
import 'package:hop_pos/src/order_payments/daos/order_payment_dao.dart';
import 'package:hop_pos/src/order_payments/models/order_payment.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'order_payment_repository.g.dart';

@riverpod
OrderPaymentRepository orderPaymentRepo(OrderPaymentRepoRef ref) {
  return OrderPaymentRepository(
    orderPaymentDao: ref.watch(appDbProvider.select((prov) => prov.orderPaymentDao)),
  );
}

class OrderPaymentRepository {
  final OrderPaymentDao orderPaymentDao;

  OrderPaymentRepository({
    required this.orderPaymentDao,
  });

  Future<OrderPayment> insert(OrderPaymentsTableCompanion payment) async {
    return await orderPaymentDao.insertOrderPayment(payment);
  }

  Future<List<OrderPayment>> insertMany(List<OrderPaymentsTableCompanion> payments) async {
    return await orderPaymentDao.insertOrderPayments(payments);
  }

  Future<bool> delete(OrderPayment payment) async {
    return await orderPaymentDao.deleteOrderPayment(payment);
  }
}
