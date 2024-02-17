// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_payment_with_method.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderPaymentWithMethodImpl _$$OrderPaymentWithMethodImplFromJson(
        Map<String, dynamic> json) =>
    _$OrderPaymentWithMethodImpl(
      payment: OrderPayment.fromJson(json['payment'] as Map<String, dynamic>),
      method: json['method'] == null
          ? null
          : PaymentMethod.fromJson(json['method'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$OrderPaymentWithMethodImplToJson(
        _$OrderPaymentWithMethodImpl instance) =>
    <String, dynamic>{
      'payment': instance.payment,
      'method': instance.method,
    };
