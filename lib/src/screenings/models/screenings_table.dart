import 'package:drift/drift.dart';
import 'package:hop_pos/src/screenings/models/screening.dart';

@TableIndex(name: 'screenings_id', columns: {#id}, unique: true)
@UseRowClass(Screening)
class ScreeningsTable extends Table {
  @override
  String get tableName => 'screenings';
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(max: 255)();
  TextColumn get corporate => text().withLength(max: 255).nullable()();
}
