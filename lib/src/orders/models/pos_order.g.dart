// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pos_order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderImpl _$$OrderImplFromJson(Map<String, dynamic> json) => _$OrderImpl(
      order: Order.fromJson(json['order'] as Map<String, dynamic>),
      payLater: json['payLater'] as bool? ?? false,
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => OrderItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      extras: (json['extras'] as List<dynamic>?)
          ?.map((e) => OrderExtra.fromJson(e as Map<String, dynamic>))
          .toList(),
      payments: (json['payments'] as List<dynamic>?)
          ?.map((e) => OrderPayment.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$OrderImplToJson(_$OrderImpl instance) =>
    <String, dynamic>{
      'order': instance.order,
      'payLater': instance.payLater,
      'items': instance.items,
      'extras': instance.extras,
      'payments': instance.payments,
    };
