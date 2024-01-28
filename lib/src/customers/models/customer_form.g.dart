// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_form.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CustomerFormImpl _$$CustomerFormImplFromJson(Map<String, dynamic> json) =>
    _$CustomerFormImpl(
      id: json['id'] as int?,
      fullName: json['full_name'] as String?,
      nric: json['nric'] as String?,
      dob: json['dob'] == null ? null : DateTime.parse(json['dob'] as String),
      gender: json['gender'] as String?,
      email: json['email'] as String?,
      mobileNo: json['mobile_no'] as String?,
      sendAccountInvitation: json['send_account_invitation'] as bool? ?? true,
      isNew: json['is_new'] as bool? ?? false,
    );

Map<String, dynamic> _$$CustomerFormImplToJson(_$CustomerFormImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'full_name': instance.fullName,
      'nric': instance.nric,
      'dob': instance.dob?.toIso8601String(),
      'gender': instance.gender,
      'email': instance.email,
      'mobile_no': instance.mobileNo,
      'send_account_invitation': instance.sendAccountInvitation,
      'is_new': instance.isNew,
    };
