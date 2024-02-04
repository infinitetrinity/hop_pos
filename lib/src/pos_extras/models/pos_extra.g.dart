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
      type: $enumDecode(_$ExtraTypeEnumMap, json['type']),
      amount:
          const DoubleFromStringConverter().fromJson(json['amount'] as String?),
      amountType: $enumDecode(_$ExtraAmountTypeEnumMap, json['amount_type']),
      isActive: json['is_active'] as bool,
    );

Map<String, dynamic> _$$PosExtraImplToJson(_$PosExtraImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'type': _$ExtraTypeEnumMap[instance.type]!,
      'amount': const DoubleFromStringConverter().toJson(instance.amount),
      'amount_type': _$ExtraAmountTypeEnumMap[instance.amountType]!,
      'is_active': instance.isActive,
    };

const _$ExtraTypeEnumMap = {
  ExtraType.deduct: 'deduct',
  ExtraType.add: 'add',
};

const _$ExtraAmountTypeEnumMap = {
  ExtraAmountType.dollars: 'dollars',
  ExtraAmountType.percentage: 'percentage',
};
