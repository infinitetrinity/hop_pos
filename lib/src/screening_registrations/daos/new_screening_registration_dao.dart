import 'package:drift/drift.dart';
import 'package:hop_pos/app/app_db.dart';
import 'package:hop_pos/src/customers/models/customers_table.dart';
import 'package:hop_pos/src/customers/models/new_customers_table.dart';
import 'package:hop_pos/src/orders/models/new_orders_table.dart';
import 'package:hop_pos/src/orders/models/orders_table.dart';
import 'package:hop_pos/src/screening_registrations/models/new_screening_registrations_table.dart';
import 'package:hop_pos/src/screening_registrations/models/screening_registration.dart';
import 'package:hop_pos/src/screening_timeslots/models/screening_timeslots_table.dart';

part 'new_screening_registration_dao.g.dart';

@DriftAccessor(tables: [
  NewScreeningRegistrationsTable,
  ScreeningTimeslotsTable,
  CustomersTable,
  NewCustomersTable,
  OrdersTable,
  NewOrdersTable,
])
class NewScreeningRegistrationDao extends DatabaseAccessor<AppDb> with _$NewScreeningRegistrationDaoMixin {
  NewScreeningRegistrationDao(AppDb db) : super(db);

  Future<ScreeningRegistration> insertNewScreeningRegistration(
      NewScreeningRegistrationsTableCompanion registration) async {
    return await into(newScreeningRegistrationsTable).insertReturning(registration);
  }

  Future<List<ScreeningRegistration>> getAll() {
    final query = select(newScreeningRegistrationsTable);

    query.orderBy([(table) => OrderingTerm.asc(table.id)]);
    return query.get();
  }

  Future<bool> deleteByIds(List<int> ids) async {
    final count = await (delete(newScreeningRegistrationsTable)..where((tbl) => tbl.id.isIn(ids))).go();
    return count > 0;
  }
}
