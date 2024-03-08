// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pos_order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PosOrderImpl _$$PosOrderImplFromJson(Map<String, dynamic> json) =>
    _$PosOrderImpl(
      order: Order.fromJson(json['order'] as Map<String, dynamic>),
      payLater: json['payLater'] as bool? ?? false,
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => OrderItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      extras: (json['extras'] as List<dynamic>?)
          ?.map((e) => OrderExtra.fromJson(e as Map<String, dynamic>))
          .toList(),
      payments: (json['payments'] as List<dynamic>?)
          ?.map(
              (e) => OrderPaymentWithMethod.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$PosOrderImplToJson(_$PosOrderImpl instance) =>
    <String, dynamic>{
      'order': instance.order,
      'payLater': instance.payLater,
      'items': instance.items,
      'extras': instance.extras,
      'payments': instance.payments,
    };
