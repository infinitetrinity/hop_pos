import 'package:drift/drift.dart';
import 'package:hop_pos/app/app_db.dart';
import 'package:hop_pos/src/order_payments/models/order_payment.dart';
import 'package:hop_pos/src/order_payments/models/order_payments_table.dart';

part 'order_payment_dao.g.dart';

@DriftAccessor(tables: [OrderPaymentsTable])
class OrderPaymentDao extends DatabaseAccessor<AppDb> with _$OrderPaymentDaoMixin {
  OrderPaymentDao(AppDb db) : super(db);

  Future<OrderPayment> insertOrderPayment(OrderPaymentsTableCompanion payment) async {
    return await into(orderPaymentsTable).insertReturning(payment);
  }

  Future<List<OrderPayment>> insertOrderPayments(List<OrderPaymentsTableCompanion> payments) async {
    return await transaction(() async {
      List<Future<OrderPayment>> insertFutures = [];

      for (OrderPaymentsTableCompanion payment in payments) {
        insertFutures.add(insertOrderPayment(payment));
      }

      List<OrderPayment> result = await Future.wait(insertFutures);
      return result;
    });
  }

  Future<bool> updateOrderPayment(OrderPaymentsTableCompanion payment, Expression<bool> where) async {
    final count = await (update(orderPaymentsTable)..where((_) => where)).write(payment);
    return count > 0;
  }
}
