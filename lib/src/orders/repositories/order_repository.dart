import 'package:hop_pos/app/app_db.dart';
import 'package:hop_pos/src/customers/models/customer.dart';
import 'package:hop_pos/src/orders/daos/order_dao.dart';
import 'package:hop_pos/src/orders/models/order.dart';
import 'package:hop_pos/src/orders/models/pos_order.dart';
import 'package:hop_pos/src/screenings/models/screening.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'order_repository.g.dart';

@riverpod
OrderRepository orderRepo(OrderRepoRef ref) {
  return OrderRepository(
    orderDao: ref.watch(appDbProvider.select((prov) => prov.orderDao)),
  );
}

class OrderRepository {
  final OrderDao orderDao;

  OrderRepository({
    required this.orderDao,
  });

  Future<Order> insert(OrdersTableCompanion order) async {
    return await orderDao.insertOrder(order);
  }

  Future<List<Order>> insertMany(List<OrdersTableCompanion> orders) async {
    return await orderDao.insertOrders(orders);
  }

  Future<List<PosOrder>?> getScreeningCustomerOrders(Screening screening, Customer customer) async {
    return await orderDao.getScreeningCustomerOrders(screening, customer);
  }
}
