import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:hop_pos/src/company/daos/company_dao.dart';
import 'package:hop_pos/src/company/models/company.dart';
import 'package:hop_pos/src/company/models/company_table.dart';
import 'package:hop_pos/src/customers/daos/customer_dao.dart';
import 'package:hop_pos/src/customers/models/customer.dart';
import 'package:hop_pos/src/customers/models/customers_table.dart';
import 'package:hop_pos/src/orders/daos/order_dao.dart';
import 'package:hop_pos/src/orders/models/order.dart';
import 'package:hop_pos/src/orders/models/orders_table.dart';
import 'package:hop_pos/src/payment_methods/daos/payment_method_dao.dart';
import 'package:hop_pos/src/payment_methods/models/payment_method.dart';
import 'package:hop_pos/src/payment_methods/models/payment_methods_table.dart';
import 'package:hop_pos/src/pos_extras/daos/pos_extra_dao.dart';
import 'package:hop_pos/src/pos_extras/models/pos_extra.dart';
import 'package:hop_pos/src/pos_extras/models/pos_extras_table.dart';
import 'package:hop_pos/src/pos_licenses/daos/pos_license_dao.dart';
import 'package:hop_pos/src/pos_licenses/models/pos_license.dart';
import 'package:hop_pos/src/pos_licenses/models/pos_licenses_table.dart';
import 'package:hop_pos/src/product_categories/daos/product_category_dao.dart';
import 'package:hop_pos/src/product_categories/models/product_categories_table.dart';
import 'package:hop_pos/src/product_categories/models/product_category.dart';
import 'package:hop_pos/src/products/dao/product_dao.dart';
import 'package:hop_pos/src/products/models/product.dart';
import 'package:hop_pos/src/products/models/products_table.dart';
import 'package:hop_pos/src/receipt_settings/daos/receipt_setting_dao.dart';
import 'package:hop_pos/src/receipt_settings/models/receipt_setting.dart';
import 'package:hop_pos/src/receipt_settings/models/receipt_settings_table.dart';
import 'package:hop_pos/src/screening_registrations/daos/screening_registration_dao.dart';
import 'package:hop_pos/src/screening_registrations/models/screening_registration.dart';
import 'package:hop_pos/src/screening_registrations/models/screening_registrations_table.dart';
import 'package:hop_pos/src/screening_timeslots/daos/screening_timeslot_dao.dart';
import 'package:hop_pos/src/screening_timeslots/models/screening_timeslot.dart';
import 'package:hop_pos/src/screening_timeslots/models/screening_timeslots_table.dart';
import 'package:hop_pos/src/screening_venues/daos/screening_venue_dao.dart';
import 'package:hop_pos/src/screening_venues/models/screening_venue.dart';
import 'package:hop_pos/src/screening_venues/models/screening_venues_table.dart';
import 'package:hop_pos/src/screenings/daos/screening_dao.dart';
import 'package:hop_pos/src/screenings/models/screening.dart';
import 'package:hop_pos/src/screenings/models/screenings_table.dart';
import 'package:hop_pos/src/users/daos/user_dao.dart';
import 'package:hop_pos/src/users/models/user.dart';
import 'package:hop_pos/src/users/models/users_table.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_db.g.dart';

@Riverpod(keepAlive: true)
AppDb appDb(AppDbRef ref) {
  final db = AppDb.instance;
  ref.onDispose(() => db.close());
  return db;
}

@DriftDatabase(tables: [
  UsersTable,
  PosLicensesTable,
  CompanyTable,
  ReceiptSettingsTable,
  PosExtrasTable,
  PaymentMethodsTable,
  ProductCategoriesTable,
  ProductsTable,
  CustomersTable,
  ScreeningsTable,
  ScreeningVenuesTable,
  ScreeningTimeslotsTable,
  ScreeningRegistrationsTable,
  OrdersTable,
], daos: [
  UserDao,
  PosLicenseDao,
  CompanyDao,
  ReceiptSettingDao,
  PosExtraDao,
  PaymentMethodDao,
  ProductCategoryDao,
  ProductDao,
  CustomerDao,
  ScreeningDao,
  ScreeningVenueDao,
  ScreeningTimeslotDao,
  ScreeningRegistrationDao,
  OrderDao,
])
class AppDb extends _$AppDb {
  AppDb._init() : super(initDb());
  static final AppDb instance = AppDb._init();

  @override
  int get schemaVersion => 1;
  static const String name = "hop_pos.sqlite";

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      beforeOpen: (details) async {
        await customStatement('PRAGMA foreign_keys = ON');
      },
    );
  }

  Future<void> deleteDb() async {
    print('deleting database');
    return transaction(() async {
      await customStatement('PRAGMA foreign_keys = OFF');
      for (final table in allTables) {
        await delete(table).go();
      }
      await customStatement('PRAGMA foreign_keys = ON');
    });
  }

  static LazyDatabase initDb() {
    print('opening database');
    return LazyDatabase(() async {
      final dbFolder = await getApplicationDocumentsDirectory();
      final file = File(p.join(dbFolder.path, name));
      return NativeDatabase.createInBackground(file);
    });
  }

  Stream<int> count(table, countExp) async* {
    final query = selectOnly(table)..addColumns([countExp]);
    final result = query.map((row) => row.read(countExp)).watchSingle();

    await for (final value in result) {
      yield value == null ? 0 : int.parse(value.toString());
    }

    yield 0;
  }
}
