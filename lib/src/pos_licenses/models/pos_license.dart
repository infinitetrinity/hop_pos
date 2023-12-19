import 'package:freezed_annotation/freezed_annotation.dart';

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

  factory PosLicense.fromJson(Map<String, dynamic> json) =>
      _$PosLicenseFromJson(json);

  static String get table {
    return 'pos_licenses';
  }
}
