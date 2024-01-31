import 'package:drift/drift.dart';
import 'package:hop_pos/src/screening_timeslots/models/screening_timeslot.dart';
import 'package:hop_pos/src/screening_venues/models/screening_venues_table.dart';
import 'package:hop_pos/src/screenings/models/screenings_table.dart';

@TableIndex(name: 'screening_timeslots_id', columns: {#id}, unique: true)
@TableIndex(name: 'screening_timeslots_screening_id', columns: {#screeningId})
@TableIndex(name: 'screening_timeslots_venue_id', columns: {#venueId})
@UseRowClass(ScreeningTimeslot)
class ScreeningTimeslotsTable extends Table {
  @override
  String get tableName => 'screening_timeslots';
  IntColumn get id => integer().autoIncrement()();
  DateTimeColumn get dateAndTime => dateTime()();
  IntColumn get slots => integer()();
  DateTimeColumn get specimenCollectionDate => dateTime().nullable()();
  TextColumn get specimenCollectionTime => text().nullable().withLength(max: 255)();
  TextColumn get specimenCollectionVenue => text().nullable().withLength(max: 999)();
  IntColumn get screeningId => integer().references(ScreeningsTable, #id, onDelete: KeyAction.cascade)();
  IntColumn get venueId => integer().references(ScreeningVenuesTable, #id, onDelete: KeyAction.cascade)();
}
