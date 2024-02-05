// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_item_form.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderItemFormImpl _$$OrderItemFormImplFromJson(Map<String, dynamic> json) =>
    _$OrderItemFormImpl(
      id: json['id'] as int?,
      name: json['name'] as String?,
      sku: json['sku'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      description: json['description'] as String?,
      discount: (json['discount'] as num?)?.toDouble(),
      discountType:
          $enumDecodeNullable(_$DiscountTypeEnumMap, json['discount_type']) ??
              DiscountType.percentage,
      isCustom: json['is_custom'] as bool? ?? false,
      orderIsNew: json['order_is_new'] as bool? ?? false,
      cartId: json['cart_id'] as int?,
      productId: json['product_id'] as int?,
      orderId: json['order_id'] as int?,
      isNew: json['is_new'] as bool? ?? false,
    );

Map<String, dynamic> _$$OrderItemFormImplToJson(_$OrderItemFormImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'sku': instance.sku,
      'price': instance.price,
      'description': instance.description,
      'discount': instance.discount,
      'discount_type': _$DiscountTypeEnumMap[instance.discountType],
      'is_custom': instance.isCustom,
      'order_is_new': instance.orderIsNew,
      'cart_id': instance.cartId,
      'product_id': instance.productId,
      'order_id': instance.orderId,
      'is_new': instance.isNew,
    };

const _$DiscountTypeEnumMap = {
  DiscountType.dollars: 'dollars',
  DiscountType.percentage: 'percentage',
};
