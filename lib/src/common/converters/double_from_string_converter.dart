import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hop_pos/app/app_extension.dart';

class DoubleFromStringConverter implements JsonConverter<double?, String?> {
  const DoubleFromStringConverter();

  @override
  double? fromJson(String? json) => json.isNullOrEmpty ? null : double.tryParse(json!);

  @override
  String? toJson(double? object) => object?.toString();
}
