import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hop_pos/app/app_extension.dart';
import 'package:hop_pos/src/common/converters/double_from_string_converter.dart';

part 'pos_extra.freezed.dart';
part 'pos_extra.g.dart';

enum ExtraType { deduct, add }

enum ExtraAmountType { dollars, percentage }

@freezed
class PosExtra with _$PosExtra {
  const factory PosExtra({
    required int id,
    required String name,
    String? description,
    required ExtraType type,
    @DoubleFromStringConverter() double? amount,
    @JsonKey(name: 'amount_type') required ExtraAmountType amountType,
    @JsonKey(name: 'is_active') required bool isActive,
  }) = _PosExtra;

  const PosExtra._();

  factory PosExtra.fromJson(Map<String, dynamic> json) => _$PosExtraFromJson(json);

  static List<PosExtra> fromJsonList(dynamic data) {
    return List<PosExtra>.from(
      data.map((el) => PosExtra.fromJson(el)),
    );
  }

  bool get isPercentage {
    return amountType == ExtraAmountType.percentage;
  }

  bool get isAddType {
    return type == ExtraType.add;
  }

  double calculateAmount(double value) {
    return isPercentage ? value.percentageOf(amount ?? 0) : amount ?? 0;
  }
}
