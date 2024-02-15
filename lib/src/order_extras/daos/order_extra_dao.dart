import 'package:drift/drift.dart';
import 'package:hop_pos/app/app_db.dart';
import 'package:hop_pos/src/order_extras/models/order_extra.dart';
import 'package:hop_pos/src/order_extras/models/order_extras_table.dart';
import 'package:hop_pos/src/orders/models/order.dart';
import 'package:hop_pos/src/to_sync_data/models/to_sync_data.dart';

part 'order_extra_dao.g.dart';

@DriftAccessor(tables: [OrderExtrasTable])
class OrderExtraDao extends DatabaseAccessor<AppDb> with _$OrderExtraDaoMixin {
  OrderExtraDao(AppDb db) : super(db);

  Future<OrderExtra> insertOrderExtra(OrderExtrasTableCompanion extra) async {
    return await into(orderExtrasTable).insertReturning(extra);
  }

  Future<List<OrderExtra>> insertOrderExtras(List<OrderExtrasTableCompanion> extras) async {
    return await transaction(() async {
      List<Future<OrderExtra>> insertFutures = [];

      for (OrderExtrasTableCompanion extra in extras) {
        insertFutures.add(insertOrderExtra(extra));
      }

      List<OrderExtra> result = await Future.wait(insertFutures);
      return result;
    });
  }

  Future<bool> updateOrderExtra(OrderExtra extra) async {
    return await transaction(() async {
      final count = await (update(orderExtrasTable)..where((tbl) => tbl.id.equals(extra.id!))).write(extra.toData());

      await db.toSycnDataDao.insertToSyncData(extra.toSyncData(ToSyncActions.update));
      return count > 0;
    });
  }

  Future<bool> deleteOrderExtra(OrderExtra extra) async {
    return await transaction(() async {
      final count = await (delete(orderExtrasTable)..where((tbl) => tbl.id.equals(extra.id!))).go();

      await db.toSycnDataDao.insertToSyncData(extra.toSyncData(ToSyncActions.delete));
      return count > 0;
    });
  }

  Future<void> deleteByOrder(Order order) async {
    return await transaction(() async {
      final extras = await (select(orderExtrasTable)..where((tbl) => tbl.orderId.equals(order.id!))).get();
      List<Future<bool>> deleteFutures = [];

      for (OrderExtra extra in extras) {
        deleteFutures.add(deleteOrderExtra(extra));
      }

      await Future.wait(deleteFutures);
    });
  }
}
