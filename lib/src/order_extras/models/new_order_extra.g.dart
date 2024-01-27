// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_order_extra.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NewOrderExtraImpl _$$NewOrderExtraImplFromJson(Map<String, dynamic> json) =>
    _$NewOrderExtraImpl(
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
      orderIsNew: json['order_is_new'] as bool,
      createdAt: DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$$NewOrderExtraImplToJson(_$NewOrderExtraImpl instance) =>
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
      'order_is_new': instance.orderIsNew,
      'created_at': instance.createdAt.toIso8601String(),
    };
