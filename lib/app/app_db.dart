import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:hop_pos/app/app_logger.dart';
import 'package:hop_pos/src/common/converters/json_converter.dart';
import 'package:hop_pos/src/company/daos/company_dao.dart';
import 'package:hop_pos/src/company/models/company.dart';
import 'package:hop_pos/src/company/models/company_table.dart';
import 'package:hop_pos/src/customers/daos/customer_dao.dart';
import 'package:hop_pos/src/customers/daos/new_customer_dao.dart';
import 'package:hop_pos/src/customers/models/customer.dart';
import 'package:hop_pos/src/customers/models/customers_table.dart';
import 'package:hop_pos/src/customers/models/new_customers_table.dart';
import 'package:hop_pos/src/order_extras/daos/new_order_extra_dao.dart';
import 'package:hop_pos/src/order_extras/daos/order_extra_dao.dart';
import 'package:hop_pos/src/order_extras/models/new_order_extras_table.dart';
import 'package:hop_pos/src/order_extras/models/order_extra.dart';
import 'package:hop_pos/src/order_extras/models/order_extras_table.dart';
import 'package:hop_pos/src/order_items/daos/new_order_item_dao.dart';
import 'package:hop_pos/src/order_items/daos/order_item_dao.dart';
import 'package:hop_pos/src/order_items/models/new_order_items_table.dart';
import 'package:hop_pos/src/order_items/models/order_item.dart';
import 'package:hop_pos/src/order_items/models/order_items_table.dart';
import 'package:hop_pos/src/order_payments/daos/new_order_payment_dao.dart';
import 'package:hop_pos/src/order_payments/daos/order_payment_dao.dart';
import 'package:hop_pos/src/order_payments/models/new_order_payments_table.dart';
import 'package:hop_pos/src/order_payments/models/order_payment.dart';
import 'package:hop_pos/src/order_payments/models/order_payments_table.dart';
import 'package:hop_pos/src/orders/daos/new_order_dao.dart';
import 'package:hop_pos/src/orders/daos/order_dao.dart';
import 'package:hop_pos/src/orders/models/new_orders_table.dart';
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
import 'package:hop_pos/src/screening_registrations/daos/new_screening_registration_dao.dart';
import 'package:hop_pos/src/screening_registrations/daos/screening_registration_dao.dart';
import 'package:hop_pos/src/screening_registrations/models/new_screening_registrations_table.dart';
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
import 'package:hop_pos/src/to_sync_data/daos/to_sync_data_dao.dart';
import 'package:hop_pos/src/to_sync_data/models/to_sync_data.dart';
import 'package:hop_pos/src/to_sync_data/models/to_sync_data_table.dart';
import 'package:hop_pos/src/users/daos/user_dao.dart';
import 'package:hop_pos/src/users/models/user.dart';
import 'package:hop_pos/src/users/models/users_table.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_db.g.dart';

@Riverpod(keepAlive: true)
AppDb appDb(AppDbRef ref) {
  return AppDb.getInstance();
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
  OrderItemsTable,
  OrderExtrasTable,
  OrderPaymentsTable,
  NewCustomersTable,
  NewOrderExtrasTable,
  NewOrderItemsTable,
  NewOrderPaymentsTable,
  NewOrdersTable,
  NewScreeningRegistrationsTable,
  ToSyncDataTable,
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
  OrderItemDao,
  OrderExtraDao,
  OrderPaymentDao,
  ToSycnDataDao,
  NewCustomerDao,
  NewScreeningRegistrationDao,
  NewOrderDao,
  NewOrderItemDao,
  NewOrderExtraDao,
  NewOrderPaymentDao,
])
class AppDb extends _$AppDb {
  AppDb._init() : super(_initDb());
  static AppDb? _instance;

  factory AppDb.getInstance() {
    _instance ??= AppDb._init();
    return _instance!;
  }

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
    await _instance?.close();
    _instance = null;
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, name));
    final exists = await file.exists();
    if (exists) {
      try {
        await file.delete();
      } catch (e, stackTrace) {
        AppLogger().e("Fail to delete db", error: e, stackTrace: stackTrace);
        rethrow;
      }
    }
  }

  static LazyDatabase _initDb() {
    return LazyDatabase(() async {
      final dbFolder = await getApplicationDocumentsDirectory();
      final file = File(p.join(dbFolder.path, name));
      return NativeDatabase.createInBackground(file);
    });
  }
}
