import 'package:drift/drift.dart';
import 'package:hop_pos/src/common/converters/json_converter.dart';
import 'package:hop_pos/src/to_sync_data/models/to_sync_data.dart';

@TableIndex(name: 'to_sync_data_model_id', columns: {#modelId})
@UseRowClass(ToSyncData)
class ToSyncDataTable extends Table {
  @override
  String get tableName => 'to_sync_data';
  IntColumn get id => integer().autoIncrement()();
  TextColumn get model => text().withLength(max: 255)();
  IntColumn get modelId => integer()();
  TextColumn get action => text().withLength(max: 255)();
  TextColumn get value => text().map(const JsonConverter())();
  DateTimeColumn get createdAt => dateTime()();
}
