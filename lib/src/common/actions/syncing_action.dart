import 'dart:convert';

import 'package:hop_pos/app/api_routes.dart';
import 'package:hop_pos/app/app_db.dart';
import 'package:hop_pos/app/app_logger.dart';
import 'package:hop_pos/src/common/models/api_request.dart';
import 'package:hop_pos/src/common/models/api_response.dart';
import 'package:hop_pos/src/common/models/sync_new_record_data.dart';
import 'package:hop_pos/src/common/models/sync_server_data.dart';
import 'package:hop_pos/src/common/models/to_delete_record_data.dart';
import 'package:hop_pos/src/common/services/api_service.dart';
import 'package:hop_pos/src/company/models/company.dart';
import 'package:hop_pos/src/customers/models/customer.dart';
import 'package:hop_pos/src/login/state/syncing_state.dart';
import 'package:hop_pos/src/order_extras/models/order_extra.dart';
import 'package:hop_pos/src/order_items/models/order_item.dart';
import 'package:hop_pos/src/order_payments/models/order_payment.dart';
import 'package:hop_pos/src/orders/models/order.dart';
import 'package:hop_pos/src/payment_methods/models/payment_method.dart';
import 'package:hop_pos/src/pos/controllers/pos_controller.dart';
import 'package:hop_pos/src/pos/models/pos_cart.dart';
import 'package:hop_pos/src/pos_extras/models/pos_extra.dart';
import 'package:hop_pos/src/product_categories/models/product_category.dart';
import 'package:hop_pos/src/products/models/product.dart';
import 'package:hop_pos/src/receipt_settings/models/receipt_setting.dart';
import 'package:hop_pos/src/screening_registrations/models/screening_registration.dart';
import 'package:hop_pos/src/screening_timeslots/models/screening_timeslot.dart';
import 'package:hop_pos/src/screening_venues/models/screening_venue.dart';
import 'package:hop_pos/src/screenings/models/screening.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'syncing_action.g.dart';

@riverpod
SyncingAction syncingAction(SyncingActionRef ref) {
  return SyncingAction(
    apiService: ref.watch(apiServiceProvider),
    syncingState: ref.watch(syncingStateProvider.notifier),
    db: ref.watch(appDbProvider),
    posCart: ref.watch(posControllerProvider),
    posController: ref.watch(posControllerProvider.notifier),
  );
}

class SyncingAction {
  final ApiService apiService;
  final SyncingState syncingState;
  final AppDb db;
  final PosCart posCart;
  final PosController posController;

  SyncingAction({
    required this.apiService,
    required this.syncingState,
    required this.db,
    required this.posCart,
    required this.posController,
  });

  Future<bool> checkServerConnection() async {
    final hasInternet = await InternetConnectionChecker().hasConnection;
    if (!hasInternet) {
      return false;
    }

    try {
      ApiResponse? result = await apiService.get(const ApiRequest(
        path: ApiRoutes.serverStatus,
        supressError: true,
      ));

      return result != null;
    } catch (e) {
      return false;
    }
  }

  Future<bool> syncServerData() async {
    final licenseKey = (await db.posLicenseDao.getFirst())?.licenseKey;
    final lastSyncedAt = (await db.userDao.getFirst())?.lastSyncedAt;
    if (licenseKey == null || lastSyncedAt == null) {
      return false;
    }

    final newCustomers = (await db.newCustomerDao.getAll());
    final newRegistrations = (await db.newScreeningRegistrationDao.getAll());
    final newOrders = (await db.newOrderDao.getAll());
    final newOrderItems = (await db.newOrderItemDao.getAll());
    final newOrderExtras = (await db.newOrderExtraDao.getAll());
    final newOrderPayments = (await db.newOrderPaymentDao.getAll());
    final syncRecords = (await db.toSycnDataDao.getAll());

    final data = SyncServerData(
      licenseKey: licenseKey,
      lastSync: lastSyncedAt,
      newRecords: SyncNewRecordData(
        customers: newCustomers,
        registrations: newRegistrations,
        orders: newOrders,
        orderItems: newOrderItems,
        orderExtras: newOrderExtras,
        orderPayments: newOrderPayments,
      ),
      syncRecords: syncRecords,
    );

    try {
      ApiResponse? result = await apiService.post(ApiRequest(
        path: ApiRoutes.syncServer,
        data: {'data': data.toJson()},
      ));

      if (result == null || result.body == null) {
        return false;
      }

      return await db.transaction(() async {
        await _removeDeletedRecords(ToDeleteRecordData.fromJsonList(result.body!['delete_records']));
        await _removeSyncedRecords(List<int>.from(result.body!['sync_records']));
        await _toSyncRecords(result.body!['data']);
        await _removeCreatedRecords(result.body!['created_records']);
        await db.userDao.updateLastSyncedNow();
        return true;
      });
    } catch (e, stackTrace) {
      AppLogger().e("Sync error", error: e, stackTrace: stackTrace);
      return false;
    }
  }

  Future<void> _removeDeletedRecords(List<ToDeleteRecordData> toDeleteData) async {
    if (toDeleteData.isEmpty) {
      return;
    }

    for (final data in toDeleteData) {
      switch (data.model) {
        case ToDeleteModels.products:
          await db.productDao.deleteById(int.parse(data.modelId));
          break;
        case ToDeleteModels.product_categories:
          await db.productCategoryDao.deleteById(int.parse(data.modelId));
          break;
        case ToDeleteModels.customers:
          await db.customerDao.deleteById(int.parse(data.modelId));
          break;
        case ToDeleteModels.payment_methods:
          await db.paymentMethodDao.deleteById(int.parse(data.modelId));
          break;
        case ToDeleteModels.screening_venues:
          await db.screeningVenueDao.deleteById(int.parse(data.modelId));
          break;
        case ToDeleteModels.screening_timeslots:
          await db.screeningTimeslotDao.deleteById(int.parse(data.modelId));
          break;
        case ToDeleteModels.screenings:
          await db.screeningDao.deleteById(int.parse(data.modelId));
          break;
        case ToDeleteModels.screening_registrations:
          final ids = jsonDecode(data.modelId);
          await db.screeningRegistrationDao.deleteById(ids[0], ids[1]);
          break;
      }
    }
  }

  Future<void> _removeSyncedRecords(List<int> ids) async {
    if (ids.isEmpty) {
      return;
    }

    await db.toSycnDataDao.deleteByIds(ids);
  }

  Future<void> _toSyncRecords(Map<String, dynamic> data) async {
    final company = Company.fromJson(data['company']);
    final receiptSetting = ReceiptSetting.fromJson(data['receipt_settings']);
    final posExtras = PosExtra.fromJsonList(data['pos_extras']);
    final paymentMethods = PaymentMethod.fromJsonList(data['payment_methods']);
    final productCategories = ProductCategory.fromJsonList(data['product_categories']);
    final products = Product.fromJsonList(data['products']);
    final customers = Customer.fromJsonList(data['customers']);
    final screenings = Screening.fromJsonList(data['screenings']);
    final screeningVenues = ScreeningVenue.fromJsonList(data['screening_venues']);
    final screeningTimeslots = ScreeningTimeslot.fromJsonList(data['screening_timeslots']);
    final screeningRegistrations = ScreeningRegistration.fromJsonList(data['screening_registrations']);
    final orders = Order.fromJsonList(data['orders']);
    final orderItems = OrderItem.fromJsonList(data['order_items']);
    final orderExtras = OrderExtra.fromJsonList(data['order_extras']);
    final orderPayments = OrderPayment.fromJsonList(data['order_payments']);

    await db.companyDao.insertOrUpdate(company);
    await db.receiptSettingDao.insertOrUpdate(receiptSetting);
    await db.posExtraDao.insertOrUpdateMany(posExtras);
    await db.paymentMethodDao.insertOrUpdateMany(paymentMethods);
    await db.productCategoryDao.insertOrUpdateMany(productCategories);
    await db.productDao.insertOrUpdateMany(products);
    await db.customerDao.insertOrUpdateMany(customers);
    await db.screeningDao.insertOrUpdateMany(screenings);
    await db.screeningVenueDao.insertOrUpdateMany(screeningVenues);
    await db.screeningTimeslotDao.insertOrUpdateMany(screeningTimeslots);
    await db.screeningRegistrationDao.insertOrUpdateMany(screeningRegistrations);
    await db.orderDao.insertOrUpdateMany(orders);
    await db.orderItemDao.insertOrUpdateMany(orderItems);
    await db.orderExtraDao.insertOrUpdateMany(orderExtras);
    await db.orderPaymentDao.insertOrUpdateMany(orderPayments);
  }

  Future<void> _removeCreatedRecords(Map<String, dynamic> records) async {
    final data = records.map((key, value) => MapEntry(key, List<int>.from(value)));
    await db.newCustomerDao.deleteByIds(data['customers'] ?? []);
    await db.newScreeningRegistrationDao.deleteByIds(data['registrations'] ?? []);

    await db.newOrderDao.deleteByIds(data['orders'] ?? []);
    await db.newOrderItemDao.deleteByIds(data['order_items'] ?? []);
    await db.newOrderExtraDao.deleteByIds(data['order_extras'] ?? []);
    await db.newOrderPaymentDao.deleteByIds(data['order_payments'] ?? []);
    await _reloadPosOrder(data['orders'] ?? []);
  }

  Future<void> _reloadPosOrder(List<int> orders) async {
    if (orders.isNotEmpty &&
        posCart.customer != null &&
        orders.contains(posCart.order?.order.id) &&
        posCart.order?.order.isNew == true) {
      await posController.selectCustomer(customer: posCart.customer!);
    }

    return;
  }
}
