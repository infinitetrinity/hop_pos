import 'package:drift/drift.dart';
import 'package:hop_pos/app/app_db.dart';
import 'package:hop_pos/src/company/models/company.dart';
import 'package:hop_pos/src/company/models/company_table.dart';

part 'company_dao.g.dart';

@DriftAccessor(tables: [CompanyTable])
class CompanyDao extends DatabaseAccessor<AppDb> with _$CompanyDaoMixin {
  CompanyDao(AppDb db) : super(db);

  Future<Company?> getFirst() async {
    final query = select(companyTable);

    return (await query.get()).firstOrNull;
  }

  Future<Company> insertCompany(CompanyTableCompanion company) async {
    return await into(companyTable).insertReturning(company);
  }

  Future<bool> updateCompany(CompanyTableCompanion company, Expression<bool> where) async {
    final count = await (update(companyTable)..where((_) => where)).write(company);
    return count > 0;
  }
}
