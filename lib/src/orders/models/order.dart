import 'package:freezed_annotation/freezed_annotation.dart';

part 'order.freezed.dart';

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

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      id: json['id'],
      isStf: json['is_stf'],
      isUtf: json['is_utf'],
      salesNote: json['sales_note'],
      invoiceNo: json['invoice_no'],
      invoicePrefix: json['invoice_prefix'],
      discount:
          json['discount'] != null ? double.tryParse(json['discount']) : null,
      discountType: json['discount_type'],
      subtotal: double.tryParse(json['subtotal']) ?? 0,
      extrasTotal: double.tryParse(json['extras_total']) ?? 0,
      netTotal: double.tryParse(json['net_total']) ?? 0,
      rounding:
          json['rounding'] != null ? double.tryParse(json['rounding']) : null,
      licenseId: json['license_id'],
      screeningId: json['screening_id'],
      customerId: json['customer_id'],
      createdAt: DateTime.parse(json['created_at']),
    );
  }

  static List<Order> fromJsonList(dynamic data) {
    return List<Order>.from(
      data.map((el) => Order.fromJson(el)),
    );
  }

  static String get table {
    return 'orders';
  }
}
