import 'package:drift/drift.dart';
import 'package:hop_pos/app/app_db.dart';
import 'package:hop_pos/src/order_payments/models/new_order_payments_table.dart';
import 'package:hop_pos/src/order_payments/models/order_payment.dart';
import 'package:hop_pos/src/orders/models/order.dart';

part 'new_order_payment_dao.g.dart';

@DriftAccessor(tables: [NewOrderPaymentsTable])
class NewOrderPaymentDao extends DatabaseAccessor<AppDb> with _$NewOrderPaymentDaoMixin {
  NewOrderPaymentDao(AppDb db) : super(db);

  Future<OrderPayment> insertNewOrderPayment(NewOrderPaymentsTableCompanion payment) async {
    return await into(newOrderPaymentsTable).insertReturning(payment);
  }

  Future<bool> deleteNewOrderPayment(OrderPayment payment) async {
    final count = await (delete(newOrderPaymentsTable)..where((tbl) => tbl.id.equals(payment.id!))).go();
    return count > 0;
  }

  Future<bool> deleteByOrder(Order order) async {
    final count = await (delete(newOrderPaymentsTable)
          ..where((tbl) => tbl.orderId.equals(order.id!))
          ..where((tbl) => tbl.orderIsNew.equals(order.isNew)))
        .go();
    return count > 0;
  }

  Future<List<OrderPayment>> getAll() {
    final query = select(newOrderPaymentsTable);

    query.orderBy([(table) => OrderingTerm.asc(table.id)]);
    return query.get();
  }

  Future<bool> deleteByIds(List<int> ids) async {
    final count = await (delete(newOrderPaymentsTable)..where((tbl) => tbl.id.isIn(ids))).go();
    return count > 0;
  }
}
