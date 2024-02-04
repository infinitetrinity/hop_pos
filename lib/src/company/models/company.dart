import 'package:drift/drift.dart' as drift;
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hop_pos/app/app_db.dart';

part 'company.freezed.dart';
part 'company.g.dart';

@freezed
class Company with _$Company {
  const factory Company({
    required int id,
    required String name,
    String? address,
    @JsonKey(name: 'postal_code') String? postalCode,
    String? email,
    String? telephone,
    String? fax,
    String? website,
    @JsonKey(name: 'co_registration_no') String? coRegistrationNo,
  }) = _Company;

  const Company._();

  factory Company.fromJson(Map<String, dynamic> json) => _$CompanyFromJson(json);

  CompanyTableCompanion toData() {
    return CompanyTableCompanion(
      id: drift.Value(id),
      name: drift.Value(name),
      address: drift.Value(address),
      postalCode: drift.Value(postalCode),
      email: drift.Value(email),
      telephone: drift.Value(telephone),
      fax: drift.Value(fax),
      website: drift.Value(website),
      coRegistrationNo: drift.Value(coRegistrationNo),
    );
  }
}
