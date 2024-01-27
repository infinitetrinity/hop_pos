// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_order_payment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NewOrderPaymentImpl _$$NewOrderPaymentImplFromJson(
        Map<String, dynamic> json) =>
    _$NewOrderPaymentImpl(
      id: json['id'] as int,
      amount:
          const DoubleFromStringConverter().fromJson(json['amount'] as String?),
      orderId: json['order_id'] as int,
      paymentMethodId: json['payment_method_id'] as int?,
      orderIsNew: json['order_is_new'] as bool,
      createdAt: DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$$NewOrderPaymentImplToJson(
        _$NewOrderPaymentImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'amount': const DoubleFromStringConverter().toJson(instance.amount),
      'order_id': instance.orderId,
      'payment_method_id': instance.paymentMethodId,
      'order_is_new': instance.orderIsNew,
      'created_at': instance.createdAt.toIso8601String(),
    };
