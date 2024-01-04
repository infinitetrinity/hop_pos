import 'package:hop_pos/app/app_db.dart';
import 'package:hop_pos/src/login/models/init_data_response.dart';
import 'package:hop_pos/src/login/models/login_response.dart';
import 'package:hop_pos/src/users/states/auth_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'login_repository.g.dart';

@riverpod
LoginRepository loginRepo(LoginRepoRef ref) {
  return LoginRepository(
    db: ref.watch(appDbProvider),
    authState: ref.watch(authStateProvider.notifier),
  );
}

class LoginRepository {
  final AppDb db;
  final AuthState authState;

  LoginRepository({
    required this.db,
    required this.authState,
  });

  Future<void> setInitData(InitDataResponse response) async {
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

  Future<void> sync(LoginResponse response) async {
    print('syncing');
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

    return await authState.login(response.user, response.accessToken);
  }

  Future<void> synced() async {
    await db.userDao.updateLastSyncedNow();
  }
}
