import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_item.freezed.dart';

@freezed
class OrderItem with _$OrderItem {
  const factory OrderItem({
    required int id,
    required String name,
    required String sku,
    String? description,
    required double price,
    double? discount,
    @JsonKey(name: 'discount_type') String? discountType,
    @JsonKey(name: 'net_price') required double netPrice,
    @JsonKey(name: 'is_custom') required bool isCustom,
    @JsonKey(name: 'cart_id') int? cartId,
    @JsonKey(name: 'product_id') int? productId,
    @JsonKey(name: 'order_id') required int orderId,
  }) = _OrderItem;

  factory OrderItem.fromJson(Map<String, dynamic> json) {
    return OrderItem(
      id: json['id'],
      name: json['name'],
      sku: json['sku'],
      description: json['description'],
      price: double.tryParse(json['price']) ?? 0,
      discount: json['discount'] != null ? double.tryParse(json['discount']) : null,
      discountType: json['discount_type'],
      netPrice: double.tryParse(json['net_price']) ?? 0,
      isCustom: json['is_custom'] == 1,
      cartId: json['cart_id'],
      productId: json['product_id'],
      orderId: json['order_id'],
    );
  }

  static List<OrderItem> fromJsonList(dynamic data) {
    return List<OrderItem>.from(
      data.map((el) => OrderItem.fromJson(el)),
    );
  }

  static String get table {
    return 'order_items';
  }
}
