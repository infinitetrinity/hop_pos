// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderImpl _$$OrderImplFromJson(Map<String, dynamic> json) => _$OrderImpl(
      id: json['id'] as int,
      isStf: json['is_stf'] as bool,
      isUtf: json['is_utf'] as bool,
      salesNote: json['sales_note'] as String?,
      invoiceNo: json['invoice_no'] as String,
      invoicePrefix: json['invoice_prefix'] as String,
      discount: (json['discount'] as num?)?.toDouble(),
      discountType: json['discount_type'] as String?,
      subtotal: (json['subtotal'] as num).toDouble(),
      extrasTotal: (json['extras_total'] as num).toDouble(),
      netTotal: (json['net_total'] as num).toDouble(),
      rounding: (json['rounding'] as num?)?.toDouble(),
      licenseId: json['license_id'] as int,
      screeningId: json['screening_id'] as int?,
      customerId: json['customer_id'] as int,
      createdAt: DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$$OrderImplToJson(_$OrderImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'is_stf': instance.isStf,
      'is_utf': instance.isUtf,
      'sales_note': instance.salesNote,
      'invoice_no': instance.invoiceNo,
      'invoice_prefix': instance.invoicePrefix,
      'discount': instance.discount,
      'discount_type': instance.discountType,
      'subtotal': instance.subtotal,
      'extras_total': instance.extrasTotal,
      'net_total': instance.netTotal,
      'rounding': instance.rounding,
      'license_id': instance.licenseId,
      'screening_id': instance.screeningId,
      'customer_id': instance.customerId,
      'created_at': instance.createdAt.toIso8601String(),
    };
