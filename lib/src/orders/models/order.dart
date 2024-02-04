import 'package:drift/drift.dart' as drift;
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hop_pos/app/app_db.dart';
import 'package:hop_pos/app/app_extension.dart';
import 'package:hop_pos/src/common/converters/double_from_string_converter.dart';
import 'package:hop_pos/src/to_sync_data/models/to_sync_data.dart';

part 'order.freezed.dart';
part 'order.g.dart';

enum DiscountType { dollars, percentage }

@freezed
class Order with _$Order {
  const factory Order({
    int? id,
    @JsonKey(name: 'is_stf') @Default(false) bool? isStf,
    @JsonKey(name: 'is_utf') @Default(false) bool? isUtf,
    @JsonKey(name: 'e_receipt') bool? eReceipt,
    @JsonKey(name: 'sales_note') String? salesNote,
    @JsonKey(name: 'invoice_no') String? invoiceNo,
    @JsonKey(name: 'invoice_prefix') String? invoicePrefix,
    @DoubleFromStringConverter() double? discount,
    @JsonKey(name: 'discount_type') DiscountType? discountType,
    @DoubleFromStringConverter() double? subtotal,
    @DoubleFromStringConverter() @JsonKey(name: 'extras_total') double? extrasTotal,
    @DoubleFromStringConverter() @JsonKey(name: 'net_total') double? netTotal,
    @DoubleFromStringConverter() double? rounding,
    @JsonKey(name: 'license_id') int? licenseId,
    @JsonKey(name: 'screening_id') int? screeningId,
    @JsonKey(name: 'customer_id') int? customerId,
    @JsonKey(name: 'customer_nric') String? customerNric,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'is_new') @Default(false) bool isNew,
  }) = _Order;

  const Order._();

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);

  static List<Order> fromJsonList(dynamic data) {
    return List<Order>.from(
      data.map((el) => Order.fromJson(el)),
    );
  }

  dynamic toData() {
    return isNew
        ? NewOrdersTableCompanion(
            id: drift.Value.ofNullable(id),
            isStf: drift.Value(isStf ?? false),
            isUtf: drift.Value(isUtf ?? false),
            eReceipt: drift.Value(eReceipt ?? false),
            salesNote: drift.Value(salesNote),
            invoiceNo: drift.Value.ofNullable(invoiceNo),
            invoicePrefix: drift.Value.ofNullable(invoicePrefix),
            discount: drift.Value(discount),
            discountType: drift.Value(discountType),
            subtotal: drift.Value(subtotal ?? 0),
            extrasTotal: drift.Value(extrasTotal ?? 0),
            netTotal: drift.Value(netTotal ?? 0),
            rounding: drift.Value(rounding),
            screeningId: drift.Value.ofNullable(screeningId),
            customerNric: drift.Value.ofNullable(customerNric),
            createdAt: drift.Value(createdAt ?? DateTime.now()),
          )
        : OrdersTableCompanion(
            id: drift.Value.ofNullable(id),
            isStf: drift.Value(isStf ?? false),
            isUtf: drift.Value(isUtf ?? false),
            salesNote: drift.Value(salesNote),
            invoiceNo: drift.Value.ofNullable(invoiceNo),
            invoicePrefix: drift.Value.ofNullable(invoicePrefix),
            discount: drift.Value(discount),
            discountType: drift.Value(discountType),
            subtotal: drift.Value(subtotal ?? 0),
            extrasTotal: drift.Value(extrasTotal ?? 0),
            netTotal: drift.Value(netTotal ?? 0),
            rounding: drift.Value(rounding),
            licenseId: drift.Value.ofNullable(licenseId),
            screeningId: drift.Value(screeningId),
            customerId: drift.Value.ofNullable(customerId),
            createdAt: drift.Value.ofNullable(createdAt),
          );
  }

  ToSyncDataTableCompanion toSyncData(ToSyncActions action) {
    return ToSyncDataTableCompanion(
      model: const drift.Value(ToSyncModels.orders),
      modelId: drift.Value(id!),
      action: drift.Value(action),
      createdAt: drift.Value(DateTime.now()),
      value: drift.Value(toJson()),
    );
  }

  String get displayInvoiceNo {
    return "$invoicePrefix$invoiceNo";
  }

  bool get isDiscountPercentage {
    return discountType == DiscountType.percentage;
  }

  double toCalculateDiscount(double value) {
    return isDiscountPercentage ? value.percentageOf(discount ?? 0) : discount ?? 0;
  }
}
