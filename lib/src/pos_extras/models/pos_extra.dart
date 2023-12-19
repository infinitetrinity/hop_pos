import 'package:freezed_annotation/freezed_annotation.dart';

part 'pos_extra.freezed.dart';
part 'pos_extra.g.dart';

@freezed
class PosExtra with _$PosExtra {
  const factory PosExtra({
    required int id,
    required String name,
    String? description,
    required String type,
    required double amount,
    @JsonKey(name: 'amount_type') required String amountType,
    required bool isActive,
  }) = _PosExtra;

  factory PosExtra.fromJson(Map<String, dynamic> json) =>
      _$PosExtraFromJson(json);

  static String get table {
    return 'pos_extras';
  }
}
