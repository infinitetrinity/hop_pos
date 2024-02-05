// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_form.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductFormImpl _$$ProductFormImplFromJson(Map<String, dynamic> json) =>
    _$ProductFormImpl(
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
    );

Map<String, dynamic> _$$ProductFormImplToJson(_$ProductFormImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'sku': instance.sku,
      'price': instance.price,
      'description': instance.description,
      'discount': instance.discount,
      'discount_type': _$DiscountTypeEnumMap[instance.discountType],
      'is_custom': instance.isCustom,
    };

const _$DiscountTypeEnumMap = {
  DiscountType.dollars: 'dollars',
  DiscountType.percentage: 'percentage',
};
