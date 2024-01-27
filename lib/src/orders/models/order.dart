import 'package:freezed_annotation/freezed_annotation.dart';

part 'order.freezed.dart';
part 'order.g.dart';

@freezed
class Order with _$Order {
  const factory Order({
    required int id,
    @JsonKey(name: 'is_stf') required bool isStf,
    @JsonKey(name: 'is_utf') required bool isUtf,
    @JsonKey(name: 'sales_note') String? salesNote,
    @JsonKey(name: 'invoice_no') required String invoiceNo,
    @JsonKey(name: 'invoice_prefix') required String invoicePrefix,
    double? discount,
    @JsonKey(name: 'discount_type') String? discountType,
    required double subtotal,
    @JsonKey(name: 'extras_total') required double extrasTotal,
    @JsonKey(name: 'net_total') required double netTotal,
    double? rounding,
    @JsonKey(name: 'license_id') required int licenseId,
    @JsonKey(name: 'screening_id') int? screeningId,
    @JsonKey(name: 'customer_id') required int customerId,
    @JsonKey(name: 'created_at') required DateTime createdAt,
  }) = _Order;

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);

  static List<Order> fromJsonList(dynamic data) {
    return List<Order>.from(
      data.map((el) => Order.fromJson(el)),
    );
  }

  static String get table {
    return 'orders';
  }
}
