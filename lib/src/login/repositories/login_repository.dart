import 'package:hop_pos/app/app_db.dart';
import 'package:hop_pos/src/common/services/auth_token.dart';
import 'package:hop_pos/src/login/models/init_data_response.dart';
import 'package:hop_pos/src/login/models/login_response.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'login_repository.g.dart';

@riverpod
LoginRepository loginRepo(LoginRepoRef ref) {
  return LoginRepository(
    db: ref.watch(appDbProvider),
  );
}

class LoginRepository {
  final AppDb db;

  LoginRepository({
    required this.db,
  });

  Future<void> setInitData(InitDataResponse response) async {
    print('setting primary data');
    return await db.transaction(() async {
      await db.customerDao.insertCustomers(response.getCustomersData());
      await db.screeningDao.insertScreenings(response.getScreeningsData());
      await db.screeningVenueDao.insertScreeningVenues(response.getScreeningVenuesData());
      await db.screeningTimeslotDao.insertScreeningTimeslots(response.getScreeningTimeslotsData());
    });
  }

  Future<void> setSecondaryData(InitDataResponse response) async {
    print('setting secondary data');
    return await db.transaction(() async {
      await db.screeningRegistrationDao.insertScreeningRegistrations(response.getScreeningRegistrationsData());
      await db.orderDao.insertOrders(response.getOrdersData());
      await db.orderItemDao.insertOrderItems(response.getOrderItemsData());
      await db.orderExtraDao.insertOrderExtras(response.getOrderExtrasData());
      await db.orderPaymentDao.insertOrderPayments(response.getOrderPaymentsData());
    });
  }

  Future<void> sync(LoginResponse response) async {
    await db.deleteDb();
    await AuthToken.setAuthToken(response.accessToken);

    print('setting settings');
    return await db.transaction(() async {
      await db.userDao.insertUser(response.getUserData());
      await db.posLicenseDao.insertLicense(response.getPosLicenseData());
      await db.companyDao.insertCompany(response.getCompanyData());
      await db.receiptSettingDao.insertSetting(response.getReceiptSettingData());
      await db.posExtraDao.insertExtras(response.getPosExtrasData());
      await db.paymentMethodDao.insertMethods(response.getPaymentMethodsData());
      await db.productCategoryDao.insertCategories(response.getProductCategoriesData());
      await db.productDao.insertProducts(response.getProductsData());
    });
  }
}
