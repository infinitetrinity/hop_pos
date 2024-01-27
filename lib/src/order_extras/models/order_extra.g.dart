// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_extra.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderExtraImpl _$$OrderExtraImplFromJson(Map<String, dynamic> json) =>
    _$OrderExtraImpl(
      id: json['id'] as int,
      name: json['name'] as String,
      type: json['type'] as String,
      description: json['description'] as String?,
      amount:
          const DoubleFromStringConverter().fromJson(json['amount'] as String?),
      amountType: json['amount_type'] as String,
      calculatedAmount: const DoubleFromStringConverter()
          .fromJson(json['calculated_amount'] as String?),
      extraId: json['extra_id'] as int?,
      orderId: json['order_id'] as int,
    );

Map<String, dynamic> _$$OrderExtraImplToJson(_$OrderExtraImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': instance.type,
      'description': instance.description,
      'amount': const DoubleFromStringConverter().toJson(instance.amount),
      'amount_type': instance.amountType,
      'calculated_amount':
          const DoubleFromStringConverter().toJson(instance.calculatedAmount),
      'extra_id': instance.extraId,
      'order_id': instance.orderId,
    };
