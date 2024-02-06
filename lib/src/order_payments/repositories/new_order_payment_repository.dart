import 'package:hop_pos/app/app_db.dart';
import 'package:hop_pos/src/order_payments/daos/new_order_payment_dao.dart';
import 'package:hop_pos/src/order_payments/models/order_payment.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'new_order_payment_repository.g.dart';

@riverpod
NewOrderPaymentRepository newOrderPaymentRepo(NewOrderPaymentRepoRef ref) {
  return NewOrderPaymentRepository(
    newOrderPaymentDao: ref.watch(appDbProvider.select((prov) => prov.newOrderPaymentDao)),
  );
}

class NewOrderPaymentRepository {
  final NewOrderPaymentDao newOrderPaymentDao;

  NewOrderPaymentRepository({
    required this.newOrderPaymentDao,
  });

  Future<OrderPayment> insert(NewOrderPaymentsTableCompanion payment) async {
    return await newOrderPaymentDao.insertNewOrderPayment(payment);
  }

  Future<bool> delete(OrderPayment payment) async {
    return await newOrderPaymentDao.deleteNewOrderPayment(payment);
  }
}
