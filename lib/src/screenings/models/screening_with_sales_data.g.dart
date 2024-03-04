// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'screening_with_sales_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ScreeningWithSalesDataImpl _$$ScreeningWithSalesDataImplFromJson(
        Map<String, dynamic> json) =>
    _$ScreeningWithSalesDataImpl(
      screening: Screening.fromJson(json['screening'] as Map<String, dynamic>),
      salesCount: json['salesCount'] as int,
      salesTotal: (json['salesTotal'] as num).toDouble(),
      paymentTotal: (json['paymentTotal'] as num).toDouble(),
      stfCount: json['stfCount'] as int,
      utfCount: json['utfCount'] as int,
      lastSalesAt: DateTime.parse(json['lastSalesAt'] as String),
    );

Map<String, dynamic> _$$ScreeningWithSalesDataImplToJson(
        _$ScreeningWithSalesDataImpl instance) =>
    <String, dynamic>{
      'screening': instance.screening,
      'salesCount': instance.salesCount,
      'salesTotal': instance.salesTotal,
      'paymentTotal': instance.paymentTotal,
      'stfCount': instance.stfCount,
      'utfCount': instance.utfCount,
      'lastSalesAt': instance.lastSalesAt.toIso8601String(),
    };
