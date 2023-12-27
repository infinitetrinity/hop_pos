import 'package:drift/drift.dart';
import 'package:hop_pos/src/order_payments/models/order_payment.dart';
import 'package:hop_pos/src/orders/models/orders_table.dart';
import 'package:hop_pos/src/payment_methods/models/payment_methods_table.dart';

@UseRowClass(OrderPayment)
class OrderPaymentsTable extends Table {
  @override
  String get tableName => 'order_payments';
  IntColumn get id => integer().autoIncrement()();
  RealColumn get amount => real()();
  IntColumn get orderId => integer().references(OrdersTable, #id, onDelete: KeyAction.cascade)();
  IntColumn get paymentMethodId => integer().nullable().references(PaymentMethodsTable, #id, onDelete: KeyAction.setNull)();
  DateTimeColumn get createdAt => dateTime()();
}
