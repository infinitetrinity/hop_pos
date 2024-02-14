// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_discount_form.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderDiscountFormImpl _$$OrderDiscountFormImplFromJson(
        Map<String, dynamic> json) =>
    _$OrderDiscountFormImpl(
      discount: (json['discount'] as num?)?.toDouble(),
      discountType:
          $enumDecodeNullable(_$DiscountTypeEnumMap, json['discount_type']),
    );

Map<String, dynamic> _$$OrderDiscountFormImplToJson(
        _$OrderDiscountFormImpl instance) =>
    <String, dynamic>{
      'discount': instance.discount,
      'discount_type': _$DiscountTypeEnumMap[instance.discountType],
    };

const _$DiscountTypeEnumMap = {
  DiscountType.dollars: 'dollars',
  DiscountType.percentage: 'percentage',
};
