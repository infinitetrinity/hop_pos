import 'package:drift/drift.dart' as drift;
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hop_pos/app/app_db.dart';
import 'package:hop_pos/src/common/converters/double_from_string_converter.dart';
import 'package:hop_pos/src/to_sync_data/models/to_sync_data.dart';
import 'package:intl/intl.dart';

part 'order_payment.freezed.dart';
part 'order_payment.g.dart';

@freezed
class OrderPayment with _$OrderPayment {
  const factory OrderPayment({
    required int id,
    @DoubleFromStringConverter() double? amount,
    @JsonKey(name: 'order_id') required int orderId,
    @JsonKey(name: 'payment_method_id') int? paymentMethodId,
    @Default(false) @JsonKey(name: 'order_is_new') bool? orderIsNew,
    @Default(false) @JsonKey(name: 'is_new') bool? isNew,
    @JsonKey(name: 'created_at') required DateTime createdAt,
  }) = _OrderPayment;

  const OrderPayment._();

  factory OrderPayment.fromJson(Map<String, dynamic> json) => _$OrderPaymentFromJson(json);

  static List<OrderPayment> fromJsonList(dynamic data) {
    return List<OrderPayment>.from(
      data.map((el) => OrderPayment.fromJson(el)),
    );
  }

  String get displayCreatedAt {
    return DateFormat('dd MMM yyyy, hh:mm a').format(createdAt);
  }

  ToSyncDataTableCompanion toSyncData(ToSyncActions action) {
    return ToSyncDataTableCompanion(
      model: const drift.Value(ToSyncModels.order_payments),
      modelId: drift.Value(id),
      action: drift.Value(action),
      createdAt: drift.Value(DateTime.now()),
      value: drift.Value(toJson()),
    );
  }
}
