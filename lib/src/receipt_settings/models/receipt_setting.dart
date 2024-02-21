import 'package:drift/drift.dart' as drift;
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hop_pos/app/app_db.dart';

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

  const ReceiptSetting._();

  factory ReceiptSetting.fromJson(Map<String, dynamic> json) => _$ReceiptSettingFromJson(json);

  ReceiptSettingsTableCompanion toData() {
    return ReceiptSettingsTableCompanion(
      id: drift.Value(id),
      footerText: drift.Value(footerText),
      outstandingSpecimenTitle: drift.Value(outstandingSpecimenTitle),
      outstandingSpecimenNoticeTitle: drift.Value(outstandingSpecimenNoticeTitle),
      outstandingSpecimenNotice: drift.Value(outstandingSpecimenNotice),
      utfTitle: drift.Value(utfTitle),
      utfNotice: drift.Value(utfNotice),
      stfTitle: drift.Value(stfTitle),
      stfNotice: drift.Value(stfNotice),
    );
  }
}
