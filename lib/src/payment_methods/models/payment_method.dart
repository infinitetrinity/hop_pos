import 'package:drift/drift.dart' as drift;
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hop_pos/app/app_db.dart';

part 'payment_method.freezed.dart';
part 'payment_method.g.dart';

@freezed
class PaymentMethod with _$PaymentMethod {
  const factory PaymentMethod({
    required int id,
    required String name,
    String? description,
  }) = _PaymentMethod;

  const PaymentMethod._();

  factory PaymentMethod.fromJson(Map<String, dynamic> json) => _$PaymentMethodFromJson(json);

  static List<PaymentMethod> fromJsonList(dynamic data) {
    return List<PaymentMethod>.from(
      data.map((el) => PaymentMethod.fromJson(el)),
    );
  }

  PaymentMethodsTableCompanion toData() {
    return PaymentMethodsTableCompanion(
      id: drift.Value(id),
      name: drift.Value(name),
      description: drift.Value(description),
    );
  }
}
