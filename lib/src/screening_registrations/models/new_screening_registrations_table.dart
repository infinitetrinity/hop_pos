import 'package:drift/drift.dart';
import 'package:hop_pos/src/screening_registrations/models/screening_registration.dart';
import 'package:hop_pos/src/screening_timeslots/models/screening_timeslots_table.dart';

@TableIndex(name: 'new_screening_registrations_id', columns: {#id}, unique: true)
@TableIndex(name: 'new_screening_registrations_index', columns: {#index})
@TableIndex(name: 'new_screening_registrations_customer_nric', columns: {#customerNric})
@TableIndex(name: 'new_screening_registrations_timeslot_id', columns: {#timeslotId})
@UseRowClass(ScreeningRegistration)
class NewScreeningRegistrationsTable extends Table {
  @override
  String get tableName => 'new_screening_registrations';
  IntColumn get id => integer().autoIncrement()();
  TextColumn get index => text().nullable()();
  TextColumn get customerNric => text().nullable()();
  IntColumn get timeslotId => integer().references(ScreeningTimeslotsTable, #id, onDelete: KeyAction.cascade)();
  DateTimeColumn get createdAt => dateTime()();
}
