import 'package:freezed_annotation/freezed_annotation.dart';

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

  factory Company.fromJson(Map<String, dynamic> json) =>
      _$CompanyFromJson(json);

  static String get table {
    return 'company';
  }
}
