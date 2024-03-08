// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_with_customer_and_payment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderWithCustomerAndPaymentImpl _$$OrderWithCustomerAndPaymentImplFromJson(
        Map<String, dynamic> json) =>
    _$OrderWithCustomerAndPaymentImpl(
      order: Order.fromJson(json['order'] as Map<String, dynamic>),
      customer: Customer.fromJson(json['customer'] as Map<String, dynamic>),
      index: json['index'] as String?,
      totalPayment: (json['totalPayment'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$OrderWithCustomerAndPaymentImplToJson(
        _$OrderWithCustomerAndPaymentImpl instance) =>
    <String, dynamic>{
      'order': instance.order,
      'customer': instance.customer,
      'index': instance.index,
      'totalPayment': instance.totalPayment,
    };
