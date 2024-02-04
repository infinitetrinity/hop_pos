import 'package:drift/drift.dart';
import 'package:hop_pos/app/app_db.dart';
import 'package:hop_pos/src/order_extras/daos/new_order_extra_dao.dart';
import 'package:hop_pos/src/order_extras/models/order_extra.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'new_order_extra_repository.g.dart';

@riverpod
NewOrderExtraRepository newOrderExtraRepo(NewOrderExtraRepoRef ref) {
  return NewOrderExtraRepository(
    db: ref.watch(appDbProvider),
    newOrderExtraDao: ref.watch(appDbProvider.select((prov) => prov.newOrderExtraDao)),
  );
}

class NewOrderExtraRepository {
  final AppDb db;
  final NewOrderExtraDao newOrderExtraDao;

  NewOrderExtraRepository({
    required this.db,
    required this.newOrderExtraDao,
  });

  Future<bool> update(OrderExtra extra, {Expression<bool>? where}) async {
    return await newOrderExtraDao.updateOrderExtra(
      extra.toData(),
      where ?? db.newOrderExtrasTable.id.equals(extra.id!),
    );
  }
}
