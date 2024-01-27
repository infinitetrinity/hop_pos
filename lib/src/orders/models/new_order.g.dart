// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NewOrderImpl _$$NewOrderImplFromJson(Map<String, dynamic> json) =>
    _$NewOrderImpl(
      id: json['id'] as int,
      isStf: json['is_stf'] as bool,
      isUtf: json['is_utf'] as bool,
      eReceipt: json['e_receipt'] as bool,
      salesNote: json['sales_note'] as String?,
      invoiceNo: json['invoice_no'] as String,
      invoicePrefix: json['invoice_prefix'] as String,
      discount: const DoubleFromStringConverter()
          .fromJson(json['discount'] as String?),
      discountType: json['discount_type'] as String?,
      subtotal: const DoubleFromStringConverter()
          .fromJson(json['subtotal'] as String?),
      extrasTotal: const DoubleFromStringConverter()
          .fromJson(json['extras_total'] as String?),
      netTotal: const DoubleFromStringConverter()
          .fromJson(json['net_total'] as String?),
      rounding: const DoubleFromStringConverter()
          .fromJson(json['rounding'] as String?),
      screeningId: json['screening_id'] as int,
      customerNric: json['customer_nric'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$$NewOrderImplToJson(_$NewOrderImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'is_stf': instance.isStf,
      'is_utf': instance.isUtf,
      'e_receipt': instance.eReceipt,
      'sales_note': instance.salesNote,
      'invoice_no': instance.invoiceNo,
      'invoice_prefix': instance.invoicePrefix,
      'discount': const DoubleFromStringConverter().toJson(instance.discount),
      'discount_type': instance.discountType,
      'subtotal': const DoubleFromStringConverter().toJson(instance.subtotal),
      'extras_total':
          const DoubleFromStringConverter().toJson(instance.extrasTotal),
      'net_total': const DoubleFromStringConverter().toJson(instance.netTotal),
      'rounding': const DoubleFromStringConverter().toJson(instance.rounding),
      'screening_id': instance.screeningId,
      'customer_nric': instance.customerNric,
      'created_at': instance.createdAt.toIso8601String(),
    };
