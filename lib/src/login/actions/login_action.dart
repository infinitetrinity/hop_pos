import 'package:hop_pos/app/api_routes.dart';
import 'package:hop_pos/app/app_db.dart';
import 'package:hop_pos/app/app_exceptions.dart';
import 'package:hop_pos/src/common/models/api_request.dart';
import 'package:hop_pos/src/common/models/api_response.dart';
import 'package:hop_pos/src/common/services/api_service.dart';
import 'package:hop_pos/src/login/models/init_data_response.dart';
import 'package:hop_pos/src/login/models/login_request.dart';
import 'package:hop_pos/src/login/models/login_response.dart';
import 'package:hop_pos/src/login/state/syncing_state.dart';
import 'package:hop_pos/src/users/actions/user_actions.dart';
import 'package:logger/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'login_action.g.dart';

@riverpod
LoginAction loginAction(LoginActionRef ref) {
  return LoginAction(
    db: ref.watch(appDbProvider),
    userActions: ref.watch(userActionsProvider),
    apiService: ref.watch(apiServiceProvider),
    syncingState: ref.watch(syncingStateProvider.notifier),
  );
}

class LoginAction {
  final AppDb db;
  final UserActions userActions;
  final ApiService apiService;
  final SyncingState syncingState;

  LoginAction({
    required this.db,
    required this.userActions,
    required this.apiService,
    required this.syncingState,
  });

  Future<void> login(LoginRequest request) async {
    ApiResponse? response = await apiService.post(
      ApiRequest(
        path: ApiRoutes.activateLicense,
        data: request.toJson(),
      ),
    );

    if (response == null || response.data == null) {
      throw AppException.unexpectedError('Unexpected error in logging in.', StackTrace.current);
    }

    try {
      await db.deleteDb();
      await insertLoginData(LoginResponse.fromJson(response.data!));
      await downloadInitData();
    } catch (e, stackTrace) {
      final logger = Logger();
      logger.e("Insert initial data error", error: e, stackTrace: stackTrace);
      rethrow;
    } finally {
      await syncingState.syncing(isSyncing: false);
    }
  }

  Future<void> insertLoginData(LoginResponse response) async {
    print('syncing');
    await syncingState.syncing();
    await db.transaction(() async {
      await db.userDao.insertUser(response.getUserData());
      await db.posLicenseDao.insertLicense(response.getPosLicenseData());
      await db.companyDao.insertCompany(response.getCompanyData());
      await db.receiptSettingDao.insertSetting(response.getReceiptSettingData());
      await db.posExtraDao.insertExtras(response.getPosExtrasData());
      await db.paymentMethodDao.insertMethods(response.getPaymentMethodsData());
      await db.productCategoryDao.insertCategories(response.getProductCategoriesData());
      await db.productDao.insertProducts(response.getProductsData());
    });

    await userActions.login(response.user, response.accessToken);
  }

  Future<void> downloadInitData({int page = 1}) async {
    ApiResponse? response = await apiService.post(
      ApiRequest(
        path: ApiRoutes.downloadInitData,
        data: {
          'page': page,
        },
      ),
    );

    if (response == null || response.data == null) {
      throw AppException.unexpectedError('Unexpected error in syncing initial data.', StackTrace.current);
    }

    InitDataResponse initDataResponse = InitDataResponse.fromJson(response.data!);
    syncingState.syncing(currentPage: page, lastPage: initDataResponse.lastPage);
    await insertInitData(initDataResponse);

    if (initDataResponse.hasNextPage) {
      await downloadInitData(
        page: page + 1,
      );
    }

    await syncingState.synced();
  }

  Future<void> insertInitData(InitDataResponse response) async {
    print('setting init data');
    await db.customStatement('PRAGMA foreign_keys = OFF');
    await db.transaction(() async {
      await db.customerDao.insertCustomers(response.getCustomersData());
      await db.screeningDao.insertScreenings(response.getScreeningsData());
      await db.screeningVenueDao.insertScreeningVenues(response.getScreeningVenuesData());
      await db.screeningTimeslotDao.insertScreeningTimeslots(response.getScreeningTimeslotsData());
      await db.screeningRegistrationDao.insertScreeningRegistrations(response.getScreeningRegistrationsData());
      await db.orderDao.insertOrders(response.getOrdersData());
      await db.orderItemDao.insertOrderItems(response.getOrderItemsData());
      await db.orderExtraDao.insertOrderExtras(response.getOrderExtrasData());
      await db.orderPaymentDao.insertOrderPayments(response.getOrderPaymentsData());
    });
    await db.customStatement('PRAGMA foreign_keys = ON');
  }

  Future<void> logout() async {
    await db.deleteDb();
    return await userActions.logout();
  }
}
