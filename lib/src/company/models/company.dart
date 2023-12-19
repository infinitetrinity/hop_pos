import 'package:freezed_annotation/freezed_annotation.dart';

part 'company.freezed.dart';
part 'company.g.dart';

@freezed
class Company with _$Company {
  const factory Company({
    required int id,
    required String name,
    required String address,
    @JsonKey(name: 'postal_code') required String postalCode,
    required String email,
    required String telephone,
    required String fax,
    required String website,
    @JsonKey(name: 'co_registration_no') required String coRegistrationNo,
  }) = _Company;

  factory Company.fromJson(Map<String, dynamic> json) =>
      _$CompanyFromJson(json);

  static String get table {
    return 'company';
  }
}
