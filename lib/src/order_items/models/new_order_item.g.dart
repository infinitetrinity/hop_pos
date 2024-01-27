// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_order_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NewOrderItemImpl _$$NewOrderItemImplFromJson(Map<String, dynamic> json) =>
    _$NewOrderItemImpl(
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
      isCustom: json['is_custom'] as bool,
      orderIsNew: json['order_is_new'] as bool,
      cartId: json['cart_id'] as int?,
      productId: json['product_id'] as int?,
      orderId: json['order_id'] as int,
      createdAt: DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$$NewOrderItemImplToJson(_$NewOrderItemImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'sku': instance.sku,
      'description': instance.description,
      'price': const DoubleFromStringConverter().toJson(instance.price),
      'discount': const DoubleFromStringConverter().toJson(instance.discount),
      'discount_type': instance.discountType,
      'net_price': const DoubleFromStringConverter().toJson(instance.netPrice),
      'is_custom': instance.isCustom,
      'order_is_new': instance.orderIsNew,
      'cart_id': instance.cartId,
      'product_id': instance.productId,
      'order_id': instance.orderId,
      'created_at': instance.createdAt.toIso8601String(),
    };
