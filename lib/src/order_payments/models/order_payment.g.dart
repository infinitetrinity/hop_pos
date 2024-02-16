// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_payment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderPaymentImpl _$$OrderPaymentImplFromJson(Map<String, dynamic> json) =>
    _$OrderPaymentImpl(
      id: json['id'] as int?,
      amount:
          const DoubleFromStringConverter().fromJson(json['amount'] as String?),
      orderId: json['order_id'] as int,
      paymentMethodId: json['payment_method_id'] as int?,
      orderIsNew: json['order_is_new'] as bool? ?? false,
      isNew: json['is_new'] as bool? ?? false,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$$OrderPaymentImplToJson(_$OrderPaymentImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'amount': const DoubleFromStringConverter().toJson(instance.amount),
      'order_id': instance.orderId,
      'payment_method_id': instance.paymentMethodId,
      'order_is_new': instance.orderIsNew,
      'is_new': instance.isNew,
      'created_at': instance.createdAt?.toIso8601String(),
    };
