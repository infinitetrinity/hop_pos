import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_method.freezed.dart';
part 'payment_method.g.dart';

@freezed
class PaymentMethod with _$PaymentMethod {
  const factory PaymentMethod({
    required int id,
    required String name,
    String? description,
  }) = _PaymentMethod;

  factory PaymentMethod.fromJson(Map<String, dynamic> json) =>
      _$PaymentMethodFromJson(json);

  static List<PaymentMethod> fromJsonList(dynamic data) {
    return List<PaymentMethod>.from(
      data.map((el) => PaymentMethod.fromJson(el)),
    );
  }

  static String get table {
    return 'payment_methods';
  }
}
