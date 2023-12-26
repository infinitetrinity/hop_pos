import 'package:drift/drift.dart';
import 'package:hop_pos/src/customers/models/customers_table.dart';
import 'package:hop_pos/src/screening_registrations/models/screening_registration.dart';
import 'package:hop_pos/src/screening_timeslots/models/screening_timeslots_table.dart';

@UseRowClass(ScreeningRegistration)
class ScreeningRegistrationsTable extends Table {
  @override
  String get tableName => 'screening_registrations';
  TextColumn get index => text().nullable()();
  IntColumn get customerId =>
      integer().references(CustomersTable, #id, onDelete: KeyAction.cascade)();
  IntColumn get timeslotId => integer()
      .references(ScreeningTimeslotsTable, #id, onDelete: KeyAction.cascade)();
}
