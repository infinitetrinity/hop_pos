import 'package:drift/drift.dart' as drift;
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hop_pos/app/app_db.dart';
import 'package:hop_pos/app/app_extension.dart';
import 'package:hop_pos/src/orders/models/order.dart';
import 'package:hop_pos/src/to_sync_data/models/to_sync_data.dart';

part 'order_item.freezed.dart';
part 'order_item.g.dart';

@freezed
class OrderItem with _$OrderItem {
  const factory OrderItem({
    int? id,
    required String name,
    required String sku,
    String? description,
    double? price,
    double? discount,
    @JsonKey(name: 'discount_type') DiscountType? discountType,
    @JsonKey(name: 'net_price') double? netPrice,
    @JsonKey(name: 'is_custom') @Default(false) bool? isCustom,
    @Default(false) @JsonKey(name: 'order_is_new') bool? orderIsNew,
    @JsonKey(name: 'cart_id') int? cartId,
    @JsonKey(name: 'product_id') int? productId,
    @JsonKey(name: 'order_id') int? orderId,
    @Default(false) @JsonKey(name: 'is_new') bool? isNew,
    @JsonKey(name: 'created_at') DateTime? createdAt,
  }) = _OrderItem;

  const OrderItem._();

  factory OrderItem.fromJson(Map<String, dynamic> json) => _$OrderItemFromJson(json);

  static List<OrderItem> fromJsonList(dynamic data) {
    return List<OrderItem>.from(
      data.map((el) => OrderItem.fromJson(el)),
    );
  }

  String get displayNetPrice {
    return (netPrice ?? 0).formatMoney;
  }

  String get displayPrice {
    return (price ?? 0).formatMoney;
  }

  bool get hasDiscount {
    return discountType != null && (discount ?? 0) > 0;
  }

  bool get isPercentageDiscount {
    return discountType == DiscountType.percentage;
  }

  double get calculatedDiscount {
    return isPercentageDiscount ? (price ?? 0).percentageOf(discount ?? 0).toDecimalPlace(2) : discount ?? 0;
  }

  double toCalculateNetPrice() {
    return (price ?? 0) - calculatedDiscount;
  }

  String? get displayDiscount {
    if (!hasDiscount) {
      return null;
    }

    return isPercentageDiscount ? "$discount%" : discount!.formatMoney;
  }

  dynamic toData() {
    return isNew == true
        ? NewOrderItemsTableCompanion(
            id: drift.Value.ofNullable(id),
            name: drift.Value(name),
            sku: drift.Value(sku),
            description: drift.Value(description),
            price: drift.Value(price ?? 0),
            discount: drift.Value(discount),
            discountType: drift.Value(discountType),
            netPrice: drift.Value(netPrice ?? 0),
            isCustom: drift.Value(isCustom ?? false),
            cartId: drift.Value(cartId),
            productId: drift.Value(productId),
            orderId: drift.Value.ofNullable(orderId),
            orderIsNew: drift.Value(orderIsNew ?? false),
            createdAt: drift.Value(DateTime.now()),
          )
        : OrderItemsTableCompanion(
            id: drift.Value.ofNullable(id),
            name: drift.Value(name),
            sku: drift.Value(sku),
            description: drift.Value(description),
            price: drift.Value(price ?? 0),
            discount: drift.Value(discount),
            discountType: drift.Value(discountType),
            netPrice: drift.Value(netPrice ?? 0),
            isCustom: drift.Value(isCustom ?? false),
            cartId: drift.Value(cartId),
            productId: drift.Value(productId),
            orderId: drift.Value.ofNullable(orderId),
          );
  }

  ToSyncDataTableCompanion toSyncData(ToSyncActions action) {
    return ToSyncDataTableCompanion(
      model: const drift.Value(ToSyncModels.order_items),
      modelId: drift.Value(id!),
      action: drift.Value(action),
      createdAt: drift.Value(DateTime.now()),
      value: drift.Value(toJson()),
    );
  }
}
