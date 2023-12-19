import 'package:drift/drift.dart';
import 'package:hop_pos/app/app_db.dart';
import 'package:hop_pos/src/pos_licenses/daos/pos_license_dao.dart';
import 'package:hop_pos/src/pos_licenses/models/pos_license.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'pos_license_repository.g.dart';

@riverpod
PosLicenseRepository posLicenseRepo(PosLicenseRepoRef ref) {
  return PosLicenseRepository(
    posLicenseDao:
        ref.watch(appDbProvider.select((prov) => prov.posLicenseDao)),
  );
}

class PosLicenseRepository {
  final PosLicenseDao posLicenseDao;

  PosLicenseRepository({
    required this.posLicenseDao,
  });

  Future<PosLicense> insert(PosLicensesTableCompanion license) async {
    return await posLicenseDao.insertLicense(license);
  }

  Future<bool> update(
      PosLicensesTableCompanion license, Expression<bool> where) async {
    return await posLicenseDao.updateLicense(license, where);
  }
}
