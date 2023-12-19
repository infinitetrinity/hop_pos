import 'package:hop_pos/app/app_db.dart';
import 'package:hop_pos/src/company/daos/company_dao.dart';
import 'package:hop_pos/src/login/models/login_response.dart';
import 'package:hop_pos/src/payment_methods/daos/payment_method_dao.dart';
import 'package:hop_pos/src/pos_extras/daos/pos_extra_dao.dart';
import 'package:hop_pos/src/pos_licenses/daos/pos_license_dao.dart';
import 'package:hop_pos/src/product_categories/daos/product_category_dao.dart';
import 'package:hop_pos/src/receipt_settings/daos/receipt_setting_dao.dart';
import 'package:hop_pos/src/users/daos/user_dao.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'login_repository.g.dart';

@riverpod
LoginRepository loginRepo(LoginRepoRef ref) {
  return LoginRepository(
    db: ref.watch(appDbProvider),
    userDao: ref.watch(appDbProvider.select((prov) => prov.userDao)),
    posLicenseDao:
        ref.watch(appDbProvider.select((prov) => prov.posLicenseDao)),
    companyDao: ref.watch(appDbProvider.select((prov) => prov.companyDao)),
    receiptSettingDao:
        ref.watch(appDbProvider.select((prov) => prov.receiptSettingDao)),
    posExtraDao: ref.watch(appDbProvider.select((prov) => prov.posExtraDao)),
    paymentMethodDao:
        ref.watch(appDbProvider.select((prov) => prov.paymentMethodDao)),
    productCategoryDao:
        ref.watch(appDbProvider.select((prov) => prov.productCategoryDao)),
  );
}

class LoginRepository {
  final AppDb db;
  final UserDao userDao;
  final PosLicenseDao posLicenseDao;
  final CompanyDao companyDao;
  final ReceiptSettingDao receiptSettingDao;
  final PosExtraDao posExtraDao;
  final PaymentMethodDao paymentMethodDao;
  final ProductCategoryDao productCategoryDao;

  LoginRepository({
    required this.db,
    required this.userDao,
    required this.posLicenseDao,
    required this.companyDao,
    required this.receiptSettingDao,
    required this.posExtraDao,
    required this.paymentMethodDao,
    required this.productCategoryDao,
  });

  Future<void> sync(LoginResponse response) async {
    return await db.transaction(() async {
      await userDao.insertUser(response.getUserData());
      await posLicenseDao.insertLicense(response.getPosLicenseData());
      await companyDao.insertCompany(response.getCompanyData());
      await receiptSettingDao.insertSetting(response.getReceiptSettingData());
      await posExtraDao.insertExtras(response.getPosExtrasData());
      await paymentMethodDao.insertMethods(response.getPaymentMethodsData());
      await productCategoryDao
          .insertCategories(response.getProductCategoriesData());
    });
  }
}
