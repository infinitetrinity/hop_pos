import 'package:drift/drift.dart';
import 'package:hop_pos/src/screening_venues/models/screening_venue.dart';
import 'package:hop_pos/src/screenings/models/screenings_table.dart';

@TableIndex(name: 'screening_venues_id', columns: {#id}, unique: true)
@TableIndex(name: 'screening_venues_screening_form_id', columns: {#screeningFormId})
@UseRowClass(ScreeningVenue)
class ScreeningVenuesTable extends Table {
  @override
  String get tableName => 'screening_venues';
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(max: 255)();
  TextColumn get fullAddress => text().withLength(max: 999).nullable()();
  IntColumn get screeningFormId => integer().references(ScreeningsTable, #id, onDelete: KeyAction.cascade)();
}
