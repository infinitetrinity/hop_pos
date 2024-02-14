import 'package:drift/drift.dart';
import 'package:hop_pos/app/app_db.dart';
import 'package:hop_pos/src/customers/models/customer.dart';
import 'package:hop_pos/src/order_extras/models/new_order_extras_table.dart';
import 'package:hop_pos/src/order_extras/models/order_extra.dart';
import 'package:hop_pos/src/order_items/models/new_order_items_table.dart';
import 'package:hop_pos/src/order_items/models/order_item.dart';
import 'package:hop_pos/src/order_payments/models/new_order_payments_table.dart';
import 'package:hop_pos/src/order_payments/models/order_payment.dart';
import 'package:hop_pos/src/orders/models/new_orders_table.dart';
import 'package:hop_pos/src/orders/models/order.dart';
import 'package:hop_pos/src/orders/models/pos_order.dart';
import 'package:hop_pos/src/screenings/models/screening.dart';

part 'new_order_dao.g.dart';

@DriftAccessor(tables: [
  NewOrdersTable,
  NewOrderItemsTable,
  NewOrderExtrasTable,
  NewOrderPaymentsTable,
])
class NewOrderDao extends DatabaseAccessor<AppDb> with _$NewOrderDaoMixin {
  NewOrderDao(AppDb db) : super(db);

  Future<PosOrder?> getScreeningCustomerLatestOrder(Screening screening, Customer customer) async {
    final latestOrder = await (select(newOrdersTable)
          ..where((tbl) => tbl.screeningId.equals(screening.id))
          ..where((tbl) => tbl.customerNric.equals(customer.nric!))
          ..orderBy([(tbl) => OrderingTerm.desc(tbl.createdAt)])
          ..limit(1))
        .getSingleOrNull();

    if (latestOrder == null) {
      return null;
    }

    final query = select(newOrdersTable).join(
      [
        leftOuterJoin(
          newOrderItemsTable,
          newOrderItemsTable.orderId.equalsExp(
            newOrdersTable.id,
          ),
        ),
        leftOuterJoin(
          newOrderExtrasTable,
          newOrderExtrasTable.orderId.equalsExp(
            newOrdersTable.id,
          ),
        ),
        leftOuterJoin(
          newOrderPaymentsTable,
          newOrderPaymentsTable.orderId.equalsExp(
            newOrdersTable.id,
          ),
        ),
      ],
    );

    query.where(newOrdersTable.id.equals(latestOrder.id!));
    final result = await query.get();
    PosOrder order = PosOrder(order: result.first.readTable(newOrdersTable).copyWith(isNew: true));

    for (final row in result) {
      final newItem = row.readTableOrNull(newOrderItemsTable)?.copyWith(isNew: true);
      if (newItem != null && order.items?.contains(newItem) != true) {
        final items = List<OrderItem>.from(order.items ?? []);
        items.add(newItem);
        order = order.copyWith(items: items);
      }

      final newExtra = row.readTableOrNull(newOrderExtrasTable)?.copyWith(isNew: true);
      if (newExtra != null && order.extras?.contains(newExtra) != true) {
        final extras = List<OrderExtra>.from(order.extras ?? []);
        extras.add(newExtra);
        order = order.copyWith(extras: extras);
      }

      final newPayment = row.readTableOrNull(newOrderPaymentsTable)?.copyWith(isNew: true);
      if (newPayment != null && order.payments?.contains(newPayment) != true) {
        final payments = List<OrderPayment>.from(order.payments ?? []);
        payments.add(newPayment);
        order = order.copyWith(payments: payments);
      }
    }

    return order.copyWith(
      items: List<OrderItem>.from(order.items ?? [])..sort((a, b) => (a.cartId ?? 0).compareTo(b.cartId ?? 0)),
    );
  }

  Future<bool> updateOrder(Order order) async {
    final count = await (update(newOrdersTable)..where((tbl) => tbl.id.equals(order.id!))).write(order.toData());
    return count > 0;
  }

  Future<int> getLastInvoiceNo() async {
    final row = await (select(newOrdersTable)
          ..orderBy([(tbl) => OrderingTerm.desc(tbl.invoiceNo.cast<int>())])
          ..limit(1))
        .getSingleOrNull();

    return int.tryParse(row?.invoiceNo ?? '') ?? 0;
  }

  Future<PosOrder> storeWithItemsAndExtras(PosOrder order) async {
    return await transaction(() async {
      print('data ${order.order.toData()}');

      final newOrder = await into(newOrdersTable).insertReturning(order.order.toData());

      for (OrderItem item in order.items ?? []) {
        await db.newOrderItemDao.insertOrderItem(item
            .copyWith(
              orderId: newOrder.id!,
              orderIsNew: true,
            )
            .toData());
      }

      for (OrderExtra extra in order.extras ?? []) {
        await db.newOrderExtraDao.insertOrderExtra(extra
            .copyWith(
              orderId: newOrder.id!,
              orderIsNew: true,
            )
            .toData());
      }

      return order.copyWith(order: newOrder);
    });
  }
}
