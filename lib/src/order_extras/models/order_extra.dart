import 'package:drift/drift.dart' as drift;
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hop_pos/app/app_db.dart';
import 'package:hop_pos/app/app_extension.dart';
import 'package:hop_pos/src/common/converters/double_from_string_converter.dart';
import 'package:hop_pos/src/pos_extras/models/pos_extra.dart';
import 'package:hop_pos/src/to_sync_data/models/to_sync_data.dart';

part 'order_extra.freezed.dart';
part 'order_extra.g.dart';

@freezed
class OrderExtra with _$OrderExtra {
  const factory OrderExtra({
    int? id,
    required String name,
    required ExtraType type,
    String? description,
    @DoubleFromStringConverter() double? amount,
    @JsonKey(name: 'amount_type') required ExtraAmountType amountType,
    @JsonKey(name: 'calculated_amount') @DoubleFromStringConverter() double? calculatedAmount,
    @JsonKey(name: 'extra_id') int? extraId,
    @JsonKey(name: 'order_id') int? orderId,
    @JsonKey(name: 'order_is_new') @Default(false) bool? orderIsNew,
    @JsonKey(name: 'is_new') @Default(false) bool isNew,
    @JsonKey(name: 'created_at') DateTime? createdAt,
  }) = _OrderExtra;

  const OrderExtra._();

  factory OrderExtra.fromJson(Map<String, dynamic> json) => _$OrderExtraFromJson(json);

  static List<OrderExtra> fromJsonList(dynamic data) {
    return List<OrderExtra>.from(
      data.map((el) => OrderExtra.fromJson(el)),
    );
  }

  dynamic toData() {
    return isNew
        ? NewOrderExtrasTableCompanion(
            id: drift.Value.ofNullable(id),
            name: drift.Value(name),
            type: drift.Value(type),
            description: drift.Value(description),
            amount: drift.Value(amount ?? 0),
            amountType: drift.Value(amountType),
            calculatedAmount: drift.Value(calculatedAmount ?? 0),
            extraId: drift.Value(extraId),
            orderId: drift.Value.ofNullable(orderId),
            orderIsNew: drift.Value(orderIsNew ?? false),
            createdAt: drift.Value(createdAt ?? DateTime.now()),
          )
        : OrderExtrasTableCompanion(
            id: drift.Value.ofNullable(id),
            name: drift.Value(name),
            type: drift.Value(type),
            description: drift.Value(description),
            amount: drift.Value(amount ?? 0),
            amountType: drift.Value(amountType),
            calculatedAmount: drift.Value(calculatedAmount ?? 0),
            extraId: drift.Value(extraId),
            orderId: drift.Value.ofNullable(orderId),
          );
  }

  ToSyncDataTableCompanion toSyncData(ToSyncActions action) {
    return ToSyncDataTableCompanion(
      model: const drift.Value(ToSyncModels.order_extras),
      modelId: drift.Value(id!),
      action: drift.Value(action),
      createdAt: drift.Value(DateTime.now()),
      value: drift.Value(toJson()),
    );
  }

  bool get isPercentage {
    return amountType == ExtraAmountType.percentage;
  }

  bool get isAddType {
    return type == ExtraType.add;
  }

  String get displayName {
    return "$name ${isPercentage && amount != null ? "(${(amount ?? 0).removeZeroDecimal()}%)" : ""}";
  }

  double toCalculateAmount(double value) {
    return isPercentage ? value.percentageOf(amount ?? 0).toDecimalPlace(2) : amount ?? 0;
  }
}
