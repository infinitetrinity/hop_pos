import 'package:drift/drift.dart';
import 'package:hop_pos/src/pos_extras/models/pos_extra.dart';

@TableIndex(name: 'pos_extras_id', columns: {#id}, unique: true)
@UseRowClass(PosExtra)
class PosExtrasTable extends Table {
  @override
  String get tableName => 'pos_extras';
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(max: 255)();
  TextColumn get description => text().nullable().withLength(max: 255)();
  TextColumn get type => textEnum<ExtraType>()();
  RealColumn get amount => real()();
  TextColumn get amountType => textEnum<ExtraAmountType>()();
  BoolColumn get isActive => boolean()();
}
