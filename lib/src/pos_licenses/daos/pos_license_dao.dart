import 'package:drift/drift.dart';
import 'package:hop_pos/app/app_db.dart';
import 'package:hop_pos/src/pos_licenses/models/pos_license.dart';
import 'package:hop_pos/src/pos_licenses/models/pos_licenses_table.dart';

part 'pos_license_dao.g.dart';

@DriftAccessor(tables: [PosLicensesTable])
class PosLicenseDao extends DatabaseAccessor<AppDb> with _$PosLicenseDaoMixin {
  PosLicenseDao(AppDb db) : super(db);

  Future<PosLicense?> getFirst() async {
    final query = select(posLicensesTable);

    return (await query.get()).firstOrNull;
  }

  Future<PosLicense> insertLicense(PosLicensesTableCompanion license) async {
    return await into(posLicensesTable).insertReturning(license);
  }

  Future<bool> updateLicense(PosLicensesTableCompanion license, Expression<bool> where) async {
    final count = await (update(posLicensesTable)..where((_) => where)).write(license);
    return count > 0;
  }

  Future<void> insertOrUpdate(PosLicense license) async {
    await into(posLicensesTable).insert(license.toData(), onConflict: DoUpdate((_) => license.toData()));
  }
}
