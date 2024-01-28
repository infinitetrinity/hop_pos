// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderItemImpl _$$OrderItemImplFromJson(Map<String, dynamic> json) =>
    _$OrderItemImpl(
      id: json['id'] as int,
      name: json['name'] as String,
      sku: json['sku'] as String,
      description: json['description'] as String?,
      price:
          const DoubleFromStringConverter().fromJson(json['price'] as String?),
      discount: const DoubleFromStringConverter()
          .fromJson(json['discount'] as String?),
      discountType: json['discount_type'] as String?,
      netPrice: const DoubleFromStringConverter()
          .fromJson(json['net_price'] as String?),
      isCustom: const BoolFromIntConverter().fromJson(json['is_custom'] as int),
      cartId: json['cart_id'] as int?,
      productId: json['product_id'] as int?,
      orderId: json['order_id'] as int,
    );

Map<String, dynamic> _$$OrderItemImplToJson(_$OrderItemImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'sku': instance.sku,
      'description': instance.description,
      'price': const DoubleFromStringConverter().toJson(instance.price),
      'discount': const DoubleFromStringConverter().toJson(instance.discount),
      'discount_type': instance.discountType,
      'net_price': const DoubleFromStringConverter().toJson(instance.netPrice),
      'is_custom': const BoolFromIntConverter().toJson(instance.isCustom),
      'cart_id': instance.cartId,
      'product_id': instance.productId,
      'order_id': instance.orderId,
    };
