// ignore_for_file: constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';

part 'to_delete_record_data.freezed.dart';
part 'to_delete_record_data.g.dart';

enum ToDeleteModels {
  customers,
  products,
  product_categories,
  screenings,
  screening_venues,
  screening_timeslots,
  screening_registrations,
  payment_methods
}

@freezed
class ToDeleteRecordData with _$ToDeleteRecordData {
  const factory ToDeleteRecordData({
    required ToDeleteModels model,
    @JsonKey(name: 'model_id') required String modelId,
  }) = _ToDeleteRecordData;

  factory ToDeleteRecordData.fromJson(Map<String, dynamic> json) => _$ToDeleteRecordDataFromJson(json);

  static List<ToDeleteRecordData> fromJsonList(dynamic data) {
    return List<ToDeleteRecordData>.from(
      data.map((el) => ToDeleteRecordData.fromJson(el)),
    );
  }
}
