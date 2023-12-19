// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CompanyImpl _$$CompanyImplFromJson(Map<String, dynamic> json) =>
    _$CompanyImpl(
      id: json['id'] as int,
      name: json['name'] as String,
      address: json['address'] as String?,
      postalCode: json['postal_code'] as String?,
      email: json['email'] as String?,
      telephone: json['telephone'] as String?,
      fax: json['fax'] as String?,
      website: json['website'] as String?,
      coRegistrationNo: json['co_registration_no'] as String?,
    );

Map<String, dynamic> _$$CompanyImplToJson(_$CompanyImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'address': instance.address,
      'postal_code': instance.postalCode,
      'email': instance.email,
      'telephone': instance.telephone,
      'fax': instance.fax,
      'website': instance.website,
      'co_registration_no': instance.coRegistrationNo,
    };
