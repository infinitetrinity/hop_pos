import 'package:freezed_annotation/freezed_annotation.dart';

part 'pos_extra.freezed.dart';

@freezed
class PosExtra with _$PosExtra {
  const factory PosExtra({
    required int id,
    required String name,
    String? description,
    required String type,
    required double amount,
    @JsonKey(name: 'amount_type') required String amountType,
    @JsonKey(name: 'is_active') required bool isActive,
  }) = _PosExtra;

  factory PosExtra.fromJson(Map<String, dynamic> json) {
    return PosExtra(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      type: json['type'],
      amount: double.tryParse(json['amount']) ?? 0,
      amountType: json['amount_type'],
      isActive: json['is_active'],
    );
  }

  static List<PosExtra> fromJsonList(dynamic data) {
    return List<PosExtra>.from(
      data.map((el) => PosExtra.fromJson(el)),
    );
  }

  static String get table {
    return 'pos_extras';
  }
}
