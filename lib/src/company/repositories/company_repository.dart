import 'package:drift/drift.dart';
import 'package:hop_pos/app/app_db.dart';
import 'package:hop_pos/src/company/daos/company_dao.dart';
import 'package:hop_pos/src/company/models/company.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'company_repository.g.dart';

@riverpod
CompanyRepository companyRepo(CompanyRepoRef ref) {
  return CompanyRepository(
    companyDao: ref.watch(appDbProvider.select((prov) => prov.companyDao)),
  );
}

class CompanyRepository {
  final CompanyDao companyDao;

  CompanyRepository({
    required this.companyDao,
  });

  Future<Company?> getFirst() async {
    return await companyDao.getFirst();
  }

  Future<Company> insert(CompanyTableCompanion company) async {
    return await companyDao.insertCompany(company);
  }

  Future<bool> update(CompanyTableCompanion company, Expression<bool> where) async {
    return await companyDao.updateCompany(company, where);
  }
}
