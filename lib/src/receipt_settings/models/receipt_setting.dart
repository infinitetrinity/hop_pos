import 'package:freezed_annotation/freezed_annotation.dart';

part 'receipt_setting.freezed.dart';
part 'receipt_setting.g.dart';

@freezed
class ReceiptSetting with _$ReceiptSetting {
  const factory ReceiptSetting({
    required int id,
    @JsonKey(name: 'footer_text') String? footerText,
    @JsonKey(name: 'outstanding_specimen_title') String? outstandingSpecimenTitle,
    @JsonKey(name: 'outstanding_specimen_notice_title') String? outstandingSpecimenNoticeTitle,
    @JsonKey(name: 'outstanding_specimen_notice') String? outstandingSpecimenNotice,
    @JsonKey(name: 'utf_title') String? utfTitle,
    @JsonKey(name: 'utf_notice') String? utfNotice,
    @JsonKey(name: 'stf_title') String? stfTitle,
    @JsonKey(name: 'stf_notice') String? stfNotice,
  }) = _ReceiptSetting;

  factory ReceiptSetting.fromJson(Map<String, dynamic> json) => _$ReceiptSettingFromJson(json);
}
