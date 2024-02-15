// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CustomerImpl _$$CustomerImplFromJson(Map<String, dynamic> json) =>
    _$CustomerImpl(
      id: json['id'] as int?,
      fullName: json['full_name'] as String,
      nric: json['nric'] as String?,
      dob: json['dob'] == null ? null : DateTime.parse(json['dob'] as String),
      gender: json['gender'] as String?,
      email: json['email'] as String?,
      mobileNo: json['mobile_no'] as String?,
      isPending: json['is_pending'] as bool? ?? false,
      sendAccountInvitation: json['send_account_invitation'] as bool? ?? false,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      isNew: json['is_new'] as bool? ?? false,
    );

Map<String, dynamic> _$$CustomerImplToJson(_$CustomerImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'full_name': instance.fullName,
      'nric': instance.nric,
      'dob': instance.dob?.toIso8601String(),
      'gender': instance.gender,
      'email': instance.email,
      'mobile_no': instance.mobileNo,
      'is_pending': instance.isPending,
      'send_account_invitation': instance.sendAccountInvitation,
      'created_at': instance.createdAt?.toIso8601String(),
      'is_new': instance.isNew,
    };
