import 'package:hop_pos/app/app_db.dart';
import 'package:hop_pos/src/company/daos/company_dao.dart';
import 'package:hop_pos/src/login/models/initial_sync_data.dart';
import 'package:hop_pos/src/pos_extras/daos/pos_extra_dao.dart';
import 'package:hop_pos/src/pos_licenses/daos/pos_license_dao.dart';
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
  );
}

class LoginRepository {
  final AppDb db;
  final UserDao userDao;
  final PosLicenseDao posLicenseDao;
  final CompanyDao companyDao;
  final ReceiptSettingDao receiptSettingDao;
  final PosExtraDao posExtraDao;

  LoginRepository({
    required this.db,
    required this.userDao,
    required this.posLicenseDao,
    required this.companyDao,
    required this.receiptSettingDao,
    required this.posExtraDao,
  });

  Future<void> sync(InitialSyncData data) async {
    return await db.transaction(() async {
      await userDao.insertUser(data.user);
      await posLicenseDao.insertLicense(data.posLicense);
      await companyDao.insertCompany(data.company);
      await receiptSettingDao.insertSetting(data.receiptSettings);
      final extras = await posExtraDao.insertExtras(data.posExtras);
      print(extras);
    });
  }
}
