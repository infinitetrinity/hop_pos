import 'package:drift/drift.dart';
import 'package:hop_pos/app/app_db.dart';
import 'package:hop_pos/src/order_extras/models/order_extra.dart';
import 'package:hop_pos/src/order_extras/models/order_extras_table.dart';

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

  Future<bool> updateOrderExtra(OrderExtrasTableCompanion extra, Expression<bool> where) async {
    final count = await (update(orderExtrasTable)..where((_) => where)).write(extra);
    return count > 0;
  }
}