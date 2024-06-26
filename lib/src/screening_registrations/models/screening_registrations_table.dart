import 'package:drift/drift.dart';
import 'package:hop_pos/src/customers/models/customers_table.dart';
import 'package:hop_pos/src/screening_registrations/models/screening_registration.dart';
import 'package:hop_pos/src/screening_timeslots/models/screening_timeslots_table.dart';

@TableIndex(name: 'screening_registrations_index', columns: {#index})
@TableIndex(name: 'screening_registrations_customer_id', columns: {#customerId})
@TableIndex(name: 'screening_registrations_timeslot_id', columns: {#timeslotId})
@UseRowClass(ScreeningRegistration)
class ScreeningRegistrationsTable extends Table {
  @override
  String get tableName => 'screening_registrations';
  TextColumn get index => text().nullable()();
  IntColumn get customerId => integer().references(CustomersTable, #id, onDelete: KeyAction.cascade)();
  IntColumn get timeslotId => integer().references(ScreeningTimeslotsTable, #id, onDelete: KeyAction.cascade)();

  @override
  List<String> get customConstraints => ['UNIQUE (customer_id, timeslot_id)'];
}
