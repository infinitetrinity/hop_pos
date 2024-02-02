import 'package:hop_pos/app/app_db.dart';
import 'package:hop_pos/src/customers/models/customer.dart';
import 'package:hop_pos/src/orders/daos/new_order_dao.dart';
import 'package:hop_pos/src/orders/models/pos_order.dart';
import 'package:hop_pos/src/screenings/models/screening.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'new_order_repository.g.dart';

@riverpod
NewOrderRepository newOrderRepo(NewOrderRepoRef ref) {
  return NewOrderRepository(
    newOrderDao: ref.watch(appDbProvider.select((prov) => prov.newOrderDao)),
  );
}

class NewOrderRepository {
  final NewOrderDao newOrderDao;

  NewOrderRepository({
    required this.newOrderDao,
  });

  Future<PosOrder?> getScreeningCustomerLatestOrder(Screening screening, Customer customer) async {
    return await newOrderDao.getScreeningCustomerLatestOrder(screening, customer);
  }
}
