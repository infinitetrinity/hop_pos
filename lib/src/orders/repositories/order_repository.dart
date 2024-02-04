import 'package:drift/drift.dart';
import 'package:hop_pos/app/app_db.dart';
import 'package:hop_pos/src/customers/models/customer.dart';
import 'package:hop_pos/src/orders/daos/order_dao.dart';
import 'package:hop_pos/src/orders/models/order.dart';
import 'package:hop_pos/src/orders/models/pos_order.dart';
import 'package:hop_pos/src/screenings/models/screening.dart';
import 'package:hop_pos/src/to_sync_data/daos/to_sync_data_dao.dart';
import 'package:hop_pos/src/to_sync_data/models/to_sync_data.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'order_repository.g.dart';

@riverpod
OrderRepository orderRepo(OrderRepoRef ref) {
  return OrderRepository(
    db: ref.watch(appDbProvider),
    orderDao: ref.watch(appDbProvider.select((prov) => prov.orderDao)),
    toSycnDataDao: ref.watch(appDbProvider.select((prov) => prov.toSycnDataDao)),
  );
}

class OrderRepository {
  final AppDb db;
  final OrderDao orderDao;
  final ToSycnDataDao toSycnDataDao;

  OrderRepository({
    required this.db,
    required this.orderDao,
    required this.toSycnDataDao,
  });

  Future<Order> insert(OrdersTableCompanion order) async {
    return await orderDao.insertOrder(order);
  }

  Future<List<Order>> insertMany(List<OrdersTableCompanion> orders) async {
    return await orderDao.insertOrders(orders);
  }

  Future<PosOrder?> getScreeningCustomerLatestOrder(Screening screening, Customer customer) async {
    return await orderDao.getScreeningCustomerLatestOrder(screening, customer);
  }

  Future<bool> update(Order order, {Expression<bool>? where}) async {
    return await db.transaction(() async {
      final result = await orderDao.updateOrder(order.toData(), where ?? db.ordersTable.id.equals(order.id!));

      await toSycnDataDao.insertToSyncData(order.toSyncData(ToSyncActions.update));
      return result;
    });
  }
}
