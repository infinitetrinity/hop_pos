import 'package:drift/drift.dart';
import 'package:hop_pos/app/app_db.dart';
import 'package:hop_pos/src/order_payments/models/order_payment.dart';
import 'package:hop_pos/src/order_payments/models/order_payments_table.dart';
import 'package:hop_pos/src/orders/models/order.dart';
import 'package:hop_pos/src/to_sync_data/models/to_sync_data.dart';

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

  Future<bool> deleteOrderPayment(OrderPayment payment) async {
    return await transaction(() async {
      final count = await (delete(orderPaymentsTable)..where((tbl) => tbl.id.equals(payment.id!))).go();

      await db.toSycnDataDao.insertToSyncData(payment.toSyncData(ToSyncActions.delete));
      return count > 0;
    });
  }

  Future<void> deleteByOrder(Order order) async {
    return await transaction(() async {
      final payments = await (select(orderPaymentsTable)..where((tbl) => tbl.orderId.equals(order.id!))).get();
      List<Future<bool>> deleteFutures = [];

      for (OrderPayment payment in payments) {
        deleteFutures.add(deleteOrderPayment(payment));
      }

      await Future.wait(deleteFutures);
    });
  }
}
