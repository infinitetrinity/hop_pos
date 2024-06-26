// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderItemImpl _$$OrderItemImplFromJson(Map<String, dynamic> json) =>
    _$OrderItemImpl(
      id: json['id'] as int?,
      name: json['name'] as String,
      sku: json['sku'] as String,
      description: json['description'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      discount: (json['discount'] as num?)?.toDouble(),
      discountType:
          $enumDecodeNullable(_$DiscountTypeEnumMap, json['discount_type']),
      netPrice: (json['net_price'] as num?)?.toDouble(),
      isCustom: json['is_custom'] as bool? ?? false,
      orderIsNew: json['order_is_new'] as bool? ?? false,
      cartId: json['cart_id'] as int?,
      productId: json['product_id'] as int?,
      orderId: json['order_id'] as int?,
      isNew: json['is_new'] as bool? ?? false,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$$OrderItemImplToJson(_$OrderItemImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'sku': instance.sku,
      'description': instance.description,
      'price': instance.price,
      'discount': instance.discount,
      'discount_type': _$DiscountTypeEnumMap[instance.discountType],
      'net_price': instance.netPrice,
      'is_custom': instance.isCustom,
      'order_is_new': instance.orderIsNew,
      'cart_id': instance.cartId,
      'product_id': instance.productId,
      'order_id': instance.orderId,
      'is_new': instance.isNew,
      'created_at': instance.createdAt?.toIso8601String(),
    };

const _$DiscountTypeEnumMap = {
  DiscountType.dollars: 'dollars',
  DiscountType.percentage: 'percentage',
};
