// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderImpl _$$OrderImplFromJson(Map<String, dynamic> json) => _$OrderImpl(
      id: json['id'] as int?,
      isStf: json['is_stf'] as bool? ?? false,
      isUtf: json['is_utf'] as bool? ?? false,
      eReceipt: json['e_receipt'] as bool?,
      salesNote: json['sales_note'] as String?,
      invoiceNo: json['invoice_no'] as String?,
      invoicePrefix: json['invoice_prefix'] as String?,
      discount: const DoubleFromStringConverter()
          .fromJson(json['discount'] as String?),
      discountType:
          $enumDecodeNullable(_$DiscountTypeEnumMap, json['discount_type']),
      subtotal: const DoubleFromStringConverter()
          .fromJson(json['subtotal'] as String?),
      extrasTotal: const DoubleFromStringConverter()
          .fromJson(json['extras_total'] as String?),
      netTotal: const DoubleFromStringConverter()
          .fromJson(json['net_total'] as String?),
      rounding: const DoubleFromStringConverter()
          .fromJson(json['rounding'] as String?),
      licenseId: json['license_id'] as int?,
      screeningId: json['screening_id'] as int?,
      customerId: json['customer_id'] as int?,
      customerNric: json['customer_nric'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      isNew: json['is_new'] as bool? ?? false,
    );

Map<String, dynamic> _$$OrderImplToJson(_$OrderImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'is_stf': instance.isStf,
      'is_utf': instance.isUtf,
      'e_receipt': instance.eReceipt,
      'sales_note': instance.salesNote,
      'invoice_no': instance.invoiceNo,
      'invoice_prefix': instance.invoicePrefix,
      'discount': const DoubleFromStringConverter().toJson(instance.discount),
      'discount_type': _$DiscountTypeEnumMap[instance.discountType],
      'subtotal': const DoubleFromStringConverter().toJson(instance.subtotal),
      'extras_total':
          const DoubleFromStringConverter().toJson(instance.extrasTotal),
      'net_total': const DoubleFromStringConverter().toJson(instance.netTotal),
      'rounding': const DoubleFromStringConverter().toJson(instance.rounding),
      'license_id': instance.licenseId,
      'screening_id': instance.screeningId,
      'customer_id': instance.customerId,
      'customer_nric': instance.customerNric,
      'created_at': instance.createdAt?.toIso8601String(),
      'is_new': instance.isNew,
    };

const _$DiscountTypeEnumMap = {
  DiscountType.dollars: 'dollars',
  DiscountType.percentage: 'percentage',
};
