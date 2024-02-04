import 'package:drift/drift.dart';
import 'package:hop_pos/app/app_db.dart';
import 'package:hop_pos/src/order_extras/models/new_order_extras_table.dart';

part 'new_order_extra_dao.g.dart';

@DriftAccessor(tables: [
  NewOrderExtrasTable,
])
class NewOrderExtraDao extends DatabaseAccessor<AppDb> with _$NewOrderExtraDaoMixin {
  NewOrderExtraDao(AppDb db) : super(db);

  Future<bool> updateOrderExtra(NewOrderExtrasTableCompanion extra, Expression<bool> where) async {
    final count = await (update(newOrderExtrasTable)..where((_) => where)).write(extra);
    return count > 0;
  }
}
