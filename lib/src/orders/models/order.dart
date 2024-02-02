import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hop_pos/src/common/converters/double_from_string_converter.dart';

part 'order.freezed.dart';
part 'order.g.dart';

@freezed
class Order with _$Order {
  const factory Order({
    required int id,
    @JsonKey(name: 'is_stf') required bool isStf,
    @JsonKey(name: 'is_utf') required bool isUtf,
    @JsonKey(name: 'e_receipt') bool? eReceipt,
    @JsonKey(name: 'sales_note') String? salesNote,
    @JsonKey(name: 'invoice_no') required String invoiceNo,
    @JsonKey(name: 'invoice_prefix') required String invoicePrefix,
    @DoubleFromStringConverter() double? discount,
    @JsonKey(name: 'discount_type') String? discountType,
    @DoubleFromStringConverter() double? subtotal,
    @DoubleFromStringConverter() @JsonKey(name: 'extras_total') double? extrasTotal,
    @DoubleFromStringConverter() @JsonKey(name: 'net_total') double? netTotal,
    @DoubleFromStringConverter() double? rounding,
    @JsonKey(name: 'license_id') int? licenseId,
    @JsonKey(name: 'screening_id') int? screeningId,
    @JsonKey(name: 'customer_id') int? customerId,
    @JsonKey(name: 'customer_nric') String? customerNric,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'is_new') @Default(false) bool isNew,
  }) = _Order;

  const Order._();

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);

  static List<Order> fromJsonList(dynamic data) {
    return List<Order>.from(
      data.map((el) => Order.fromJson(el)),
    );
  }

  String get displayInvoiceNo {
    return "$invoicePrefix$invoiceNo";
  }
}
