// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sync_new_record_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SyncNewRecordDataImpl _$$SyncNewRecordDataImplFromJson(
        Map<String, dynamic> json) =>
    _$SyncNewRecordDataImpl(
      customers: (json['customers'] as List<dynamic>)
          .map((e) => Customer.fromJson(e as Map<String, dynamic>))
          .toList(),
      registrations: (json['registrations'] as List<dynamic>)
          .map((e) => ScreeningRegistration.fromJson(e as Map<String, dynamic>))
          .toList(),
      orders: (json['orders'] as List<dynamic>)
          .map((e) => Order.fromJson(e as Map<String, dynamic>))
          .toList(),
      orderItems: (json['order_items'] as List<dynamic>)
          .map((e) => OrderItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      orderExtras: (json['order_extras'] as List<dynamic>)
          .map((e) => OrderExtra.fromJson(e as Map<String, dynamic>))
          .toList(),
      orderPayments: (json['order_payments'] as List<dynamic>)
          .map((e) => OrderPayment.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$SyncNewRecordDataImplToJson(
        _$SyncNewRecordDataImpl instance) =>
    <String, dynamic>{
      'customers': instance.customers,
      'registrations': instance.registrations,
      'orders': instance.orders,
      'order_items': instance.orderItems,
      'order_extras': instance.orderExtras,
      'order_payments': instance.orderPayments,
    };
