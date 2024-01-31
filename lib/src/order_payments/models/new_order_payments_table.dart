import 'package:drift/drift.dart';
import 'package:hop_pos/src/order_payments/models/order_payment.dart';
import 'package:hop_pos/src/orders/models/orders_table.dart';
import 'package:hop_pos/src/payment_methods/models/payment_methods_table.dart';

@TableIndex(name: 'new_order_payments_id', columns: {#id}, unique: true)
@TableIndex(name: 'new_order_payments_order_id', columns: {#orderId})
@TableIndex(name: 'new_order_payments_payment_method_id', columns: {#paymentMethodId})
@UseRowClass(OrderPayment)
class NewOrderPaymentsTable extends Table {
  @override
  String get tableName => 'new_order_payments';
  IntColumn get id => integer().autoIncrement()();
  RealColumn get amount => real()();
  IntColumn get orderId => integer().references(OrdersTable, #id, onDelete: KeyAction.cascade)();
  IntColumn get paymentMethodId =>
      integer().nullable().references(PaymentMethodsTable, #id, onDelete: KeyAction.setNull)();
  BoolColumn get orderIsNew => boolean()();
  DateTimeColumn get createdAt => dateTime()();
}
