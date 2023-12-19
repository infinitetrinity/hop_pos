// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pos_license.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PosLicenseImpl _$$PosLicenseImplFromJson(Map<String, dynamic> json) =>
    _$PosLicenseImpl(
      id: json['id'] as int,
      name: json['name'] as String,
      invoicePrefix: json['invoice_prefix'] as String,
      licenseKey: json['license_key'] as String,
      password: json['password'] as String,
      isActive: json['is_active'] as bool,
      isActivated: json['is_activated'] as bool,
    );

Map<String, dynamic> _$$PosLicenseImplToJson(_$PosLicenseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'invoice_prefix': instance.invoicePrefix,
      'license_key': instance.licenseKey,
      'password': instance.password,
      'is_active': instance.isActive,
      'is_activated': instance.isActivated,
    };
