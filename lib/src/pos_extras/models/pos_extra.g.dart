// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pos_extra.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PosExtraImpl _$$PosExtraImplFromJson(Map<String, dynamic> json) =>
    _$PosExtraImpl(
      id: json['id'] as int,
      name: json['name'] as String,
      description: json['description'] as String?,
      type: json['type'] as String,
      amount:
          const DoubleFromStringConverter().fromJson(json['amount'] as String?),
      amountType: json['amount_type'] as String,
      isActive: json['is_active'] as bool,
    );

Map<String, dynamic> _$$PosExtraImplToJson(_$PosExtraImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'type': instance.type,
      'amount': const DoubleFromStringConverter().toJson(instance.amount),
      'amount_type': instance.amountType,
      'is_active': instance.isActive,
    };
