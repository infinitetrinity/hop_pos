import 'package:drift/drift.dart';
import 'package:hop_pos/app/app_db.dart';
import 'package:hop_pos/src/order_payments/models/new_order_payments_table.dart';
import 'package:hop_pos/src/order_payments/models/order_payment.dart';

part 'new_order_payment_dao.g.dart';

@DriftAccessor(tables: [NewOrderPaymentsTable])
class NewOrderPaymentDao extends DatabaseAccessor<AppDb> with _$NewOrderPaymentDaoMixin {
  NewOrderPaymentDao(AppDb db) : super(db);

  Future<OrderPayment> insertNewOrderPayment(NewOrderPaymentsTableCompanion payment) async {
    return await into(newOrderPaymentsTable).insertReturning(payment);
  }

  Future<bool> deleteNewOrderPayment(OrderPayment payment) async {
    final count = await (delete(newOrderPaymentsTable)..where((tbl) => tbl.id.equals(payment.id))).go();
    return count > 0;
  }
}
