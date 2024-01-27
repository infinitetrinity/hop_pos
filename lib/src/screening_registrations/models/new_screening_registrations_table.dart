import 'package:drift/drift.dart';
import 'package:hop_pos/src/screening_registrations/models/new_screening_registration.dart';
import 'package:hop_pos/src/screening_timeslots/models/screening_timeslots_table.dart';

@UseRowClass(NewScreeningRegistration)
class NewScreeningRegistrationsTable extends Table {
  @override
  String get tableName => 'new_screening_registrations';
  IntColumn get id => integer().autoIncrement()();
  TextColumn get index => text().nullable()();
  TextColumn get customerNric => text().nullable()();
  IntColumn get timeslotId => integer().references(ScreeningTimeslotsTable, #id, onDelete: KeyAction.cascade)();
  DateTimeColumn get createdAt => dateTime()();
}
