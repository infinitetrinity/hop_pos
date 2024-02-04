import 'package:drift/drift.dart' as drift;
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hop_pos/app/app_db.dart';

part 'pos_license.freezed.dart';
part 'pos_license.g.dart';

@freezed
class PosLicense with _$PosLicense {
  const factory PosLicense({
    required int id,
    required String name,
    @JsonKey(name: 'invoice_prefix') required String invoicePrefix,
    @JsonKey(name: 'license_key') required String licenseKey,
    required String password,
    @JsonKey(name: 'is_active') required bool isActive,
    @JsonKey(name: 'is_activated') required bool isActivated,
  }) = _PosLicense;

  const PosLicense._();

  factory PosLicense.fromJson(Map<String, dynamic> json) => _$PosLicenseFromJson(json);

  PosLicensesTableCompanion toData() {
    return PosLicensesTableCompanion(
      id: drift.Value(id),
      name: drift.Value(name),
      invoicePrefix: drift.Value(invoicePrefix),
      licenseKey: drift.Value(licenseKey),
      password: drift.Value(password),
      isActive: drift.Value(isActive),
      isActivated: drift.Value(isActivated),
    );
  }
}
