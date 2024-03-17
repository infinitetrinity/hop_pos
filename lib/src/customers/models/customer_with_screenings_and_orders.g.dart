// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_with_screenings_and_orders.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CustomerWithScreeningsAndOrdersImpl
    _$$CustomerWithScreeningsAndOrdersImplFromJson(Map<String, dynamic> json) =>
        _$CustomerWithScreeningsAndOrdersImpl(
          customer: Customer.fromJson(json['customer'] as Map<String, dynamic>),
          screenings: (json['screenings'] as List<dynamic>?)
              ?.map((e) =>
                  CustomerWithRegistration.fromJson(e as Map<String, dynamic>))
              .toList(),
          orders: (json['orders'] as List<dynamic>?)
              ?.map((e) => OrderWithCustomerAndPayment.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
        );

Map<String, dynamic> _$$CustomerWithScreeningsAndOrdersImplToJson(
        _$CustomerWithScreeningsAndOrdersImpl instance) =>
    <String, dynamic>{
      'customer': instance.customer,
      'screenings': instance.screenings,
      'orders': instance.orders,
    };
