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
      discount: (json['discount'] as num?)?.toDouble(),
      discountType:
          $enumDecodeNullable(_$DiscountTypeEnumMap, json['discountType']),
      description: json['description'] as String?,
      isNew: json['is_new'] as bool? ?? false,
    );

Map<String, dynamic> _$$ProductFormImplToJson(_$ProductFormImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'sku': instance.sku,
      'price': instance.price,
      'discount': instance.discount,
      'discountType': _$DiscountTypeEnumMap[instance.discountType],
      'description': instance.description,
      'is_new': instance.isNew,
    };

const _$DiscountTypeEnumMap = {
  DiscountType.dollars: 'dollars',
  DiscountType.percentage: 'percentage',
};
