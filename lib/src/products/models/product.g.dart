// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductImpl _$$ProductImplFromJson(Map<String, dynamic> json) =>
    _$ProductImpl(
      id: json['id'] as int?,
      name: json['name'] as String,
      sku: json['sku'] as String,
      price:
          const DoubleFromStringConverter().fromJson(json['price'] as String?),
      description: json['description'] as String?,
      colorCode: json['color_code'] as String?,
      categoryId: json['category_id'] as int?,
      isNew: json['is_new'] as bool? ?? false,
    );

Map<String, dynamic> _$$ProductImplToJson(_$ProductImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'sku': instance.sku,
      'price': const DoubleFromStringConverter().toJson(instance.price),
      'description': instance.description,
      'color_code': instance.colorCode,
      'category_id': instance.categoryId,
      'is_new': instance.isNew,
    };
