// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_customer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NewCustomerImpl _$$NewCustomerImplFromJson(Map<String, dynamic> json) =>
    _$NewCustomerImpl(
      id: json['id'] as int,
      fullName: json['full_name'] as String,
      nric: json['nric'] as String?,
      dob: json['dob'] == null ? null : DateTime.parse(json['dob'] as String),
      gender: json['gender'] as String?,
      email: json['email'] as String?,
      mobileNo: json['mobile_no'] as String?,
      sendAccountInvitation: json['send_account_invitation'] as bool,
      createdAt: DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$$NewCustomerImplToJson(_$NewCustomerImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'full_name': instance.fullName,
      'nric': instance.nric,
      'dob': instance.dob?.toIso8601String(),
      'gender': instance.gender,
      'email': instance.email,
      'mobile_no': instance.mobileNo,
      'send_account_invitation': instance.sendAccountInvitation,
      'created_at': instance.createdAt.toIso8601String(),
    };
