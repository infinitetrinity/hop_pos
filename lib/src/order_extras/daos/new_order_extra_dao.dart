import 'package:drift/drift.dart';
import 'package:hop_pos/app/app_db.dart';
import 'package:hop_pos/src/order_extras/models/new_order_extras_table.dart';
import 'package:hop_pos/src/order_extras/models/order_extra.dart';

part 'new_order_extra_dao.g.dart';

@DriftAccessor(tables: [
  NewOrderExtrasTable,
])
class NewOrderExtraDao extends DatabaseAccessor<AppDb> with _$NewOrderExtraDaoMixin {
  NewOrderExtraDao(AppDb db) : super(db);

  Future<bool> updateOrderExtra(OrderExtra extra) async {
    final count = await (update(newOrderExtrasTable)..where((tbl) => tbl.id.equals(extra.id!))).write(extra.toData());
    return count > 0;
  }

  Future<OrderExtra> insertOrderExtra(NewOrderExtrasTableCompanion extra) async {
    return await into(newOrderExtrasTable).insertReturning(extra);
  }
}