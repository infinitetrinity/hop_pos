import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_extra.freezed.dart';

@freezed
class OrderExtra with _$OrderExtra {
  const factory OrderExtra({
    required int id,
    required String name,
    required String type,
    String? description,
    required double amount,
    @JsonKey(name: 'amount_type') required String amountType,
    @JsonKey(name: 'calculated_amount') required double calculatedAmount,
    @JsonKey(name: 'extra_id') int? extraId,
    @JsonKey(name: 'order_id') required int orderId,
  }) = _OrderExtra;

  factory OrderExtra.fromJson(Map<String, dynamic> json) {
    return OrderExtra(
      id: json['id'],
      name: json['name'],
      type: json['type'],
      description: json['description'],
      amount: double.tryParse(json['amount']) ?? 0,
      amountType: json['amount_type'],
      calculatedAmount: double.tryParse(json['calculated_amount']) ?? 0,
      extraId: json['extra_id'],
      orderId: json['order_id'],
    );
  }

  static List<OrderExtra> fromJsonList(dynamic data) {
    return List<OrderExtra>.from(
      data.map((el) => OrderExtra.fromJson(el)),
    );
  }

  static String get table {
    return 'order_extras';
  }
}
