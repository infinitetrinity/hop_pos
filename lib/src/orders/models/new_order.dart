import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hop_pos/src/common/converters/double_from_string_converter.dart';

part 'new_order.freezed.dart';
part 'new_order.g.dart';

@freezed
class NewOrder with _$NewOrder {
  const factory NewOrder({
    required int id,
    @JsonKey(name: 'is_stf') required bool isStf,
    @JsonKey(name: 'is_utf') required bool isUtf,
    @JsonKey(name: 'e_receipt') required bool eReceipt,
    @JsonKey(name: 'sales_note') String? salesNote,
    @JsonKey(name: 'invoice_no') required String invoiceNo,
    @JsonKey(name: 'invoice_prefix') required String invoicePrefix,
    @DoubleFromStringConverter() double? discount,
    @JsonKey(name: 'discount_type') String? discountType,
    @DoubleFromStringConverter() double? subtotal,
    @DoubleFromStringConverter() @JsonKey(name: 'extras_total') double? extrasTotal,
    @DoubleFromStringConverter() @JsonKey(name: 'net_total') double? netTotal,
    @DoubleFromStringConverter() double? rounding,
    @JsonKey(name: 'screening_id') required int screeningId,
    @JsonKey(name: 'customer_nric') required String customerNric,
    @JsonKey(name: 'created_at') required DateTime createdAt,
  }) = _NewOrder;

  factory NewOrder.fromJson(Map<String, dynamic> json) => _$NewOrderFromJson(json);
}
