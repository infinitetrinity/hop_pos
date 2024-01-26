// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_form.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CustomerFormImpl _$$CustomerFormImplFromJson(Map<String, dynamic> json) =>
    _$CustomerFormImpl(
      id: json['id'] as int?,
      nric: json['nric'] as String?,
      fullName: json['full_name'] as String?,
      mobileNo: json['mobile_no'] as String?,
      gender: json['gender'] as String?,
      email: json['email'] as String?,
      dob: json['dob'] == null ? null : DateTime.parse(json['dob'] as String),
    );

Map<String, dynamic> _$$CustomerFormImplToJson(_$CustomerFormImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nric': instance.nric,
      'full_name': instance.fullName,
      'mobile_no': instance.mobileNo,
      'gender': instance.gender,
      'email': instance.email,
      'dob': instance.dob?.toIso8601String(),
    };
