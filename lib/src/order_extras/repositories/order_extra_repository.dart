import 'package:hop_pos/app/app_db.dart';
import 'package:hop_pos/src/order_extras/daos/order_extra_dao.dart';
import 'package:hop_pos/src/order_extras/models/order_extra.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'order_extra_repository.g.dart';

@riverpod
OrderExtraRepository orderExtraRepo(OrderExtraRepoRef ref) {
  return OrderExtraRepository(
    orderExtraDao: ref.watch(appDbProvider.select((prov) => prov.orderExtraDao)),
  );
}

class OrderExtraRepository {
  final OrderExtraDao orderExtraDao;

  OrderExtraRepository({
    required this.orderExtraDao,
  });

  Future<OrderExtra> insert(OrderExtrasTableCompanion extra) async {
    return await orderExtraDao.insertOrderExtra(extra);
  }

  Future<List<OrderExtra>> insertMany(List<OrderExtrasTableCompanion> extras) async {
    return await orderExtraDao.insertOrderExtras(extras);
  }

  Future<bool> update(OrderExtra extra) async {
    return await orderExtraDao.updateOrderExtra(extra);
  }
}
