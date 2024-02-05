// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductImpl _$$ProductImplFromJson(Map<String, dynamic> json) =>
    _$ProductImpl(
      id: json['id'] as int?,
      name: json['name'] as String,
      sku: json['sku'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      description: json['description'] as String?,
      discount: (json['discount'] as num?)?.toDouble(),
      discountType:
          $enumDecodeNullable(_$DiscountTypeEnumMap, json['discount_type']),
      colorCode: json['color_code'] as String?,
      categoryId: json['category_id'] as int?,
      isNew: json['is_new'] as bool? ?? false,
      isCustom: json['is_custom'] as bool? ?? false,
    );

Map<String, dynamic> _$$ProductImplToJson(_$ProductImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'sku': instance.sku,
      'price': instance.price,
      'description': instance.description,
      'discount': instance.discount,
      'discount_type': _$DiscountTypeEnumMap[instance.discountType],
      'color_code': instance.colorCode,
      'category_id': instance.categoryId,
      'is_new': instance.isNew,
      'is_custom': instance.isCustom,
    };

const _$DiscountTypeEnumMap = {
  DiscountType.dollars: 'dollars',
  DiscountType.percentage: 'percentage',
};
