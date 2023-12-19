// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'receipt_setting.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReceiptSettingImpl _$$ReceiptSettingImplFromJson(Map<String, dynamic> json) =>
    _$ReceiptSettingImpl(
      id: json['id'] as int,
      footerText: json['footer_text'] as String?,
      outstandingSpecimenTitle: json['outstanding_specimen_title'] as String?,
      outstandingSpecimenNoticeTitle:
          json['outstanding_specimen_notice_title'] as String?,
      outstandingSpecimenNotice: json['outstanding_specimen_notice'] as String?,
      utfTitle: json['utf_title'] as String?,
      utfNotice: json['utf_notice'] as String?,
      stfTitle: json['stf_title'] as String?,
      stfNotice: json['stf_notice'] as String?,
    );

Map<String, dynamic> _$$ReceiptSettingImplToJson(
        _$ReceiptSettingImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'footer_text': instance.footerText,
      'outstanding_specimen_title': instance.outstandingSpecimenTitle,
      'outstanding_specimen_notice_title':
          instance.outstandingSpecimenNoticeTitle,
      'outstanding_specimen_notice': instance.outstandingSpecimenNotice,
      'utf_title': instance.utfTitle,
      'utf_notice': instance.utfNotice,
      'stf_title': instance.stfTitle,
      'stf_notice': instance.stfNotice,
    };
