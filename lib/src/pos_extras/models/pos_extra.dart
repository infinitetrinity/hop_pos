import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hop_pos/src/common/converters/double_from_string_converter.dart';

part 'pos_extra.freezed.dart';
part 'pos_extra.g.dart';

@freezed
class PosExtra with _$PosExtra {
  const factory PosExtra({
    required int id,
    required String name,
    String? description,
    required String type,
    @DoubleFromStringConverter() double? amount,
    @JsonKey(name: 'amount_type') required String amountType,
    @JsonKey(name: 'is_active') required bool isActive,
  }) = _PosExtra;

  factory PosExtra.fromJson(Map<String, dynamic> json) => _$PosExtraFromJson(json);

  static List<PosExtra> fromJsonList(dynamic data) {
    return List<PosExtra>.from(
      data.map((el) => PosExtra.fromJson(el)),
    );
  }
}
