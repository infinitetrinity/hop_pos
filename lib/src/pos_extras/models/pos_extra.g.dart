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
      amount: (json['amount'] as num).toDouble(),
      amountType: json['amount_type'] as String,
      isActive: json['isActive'] as bool,
    );

Map<String, dynamic> _$$PosExtraImplToJson(_$PosExtraImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'type': instance.type,
      'amount': instance.amount,
      'amount_type': instance.amountType,
      'isActive': instance.isActive,
    };
