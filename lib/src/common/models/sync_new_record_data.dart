import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hop_pos/src/customers/models/customer.dart';
import 'package:hop_pos/src/order_extras/models/order_extra.dart';
import 'package:hop_pos/src/order_items/models/order_item.dart';
import 'package:hop_pos/src/order_payments/models/order_payment.dart';
import 'package:hop_pos/src/orders/models/order.dart';
import 'package:hop_pos/src/screening_registrations/models/screening_registration.dart';

part 'sync_new_record_data.freezed.dart';
part 'sync_new_record_data.g.dart';

@freezed
class SyncNewRecordData with _$SyncNewRecordData {
  const factory SyncNewRecordData({
    required List<Customer> customers,
    required List<ScreeningRegistration> registrations,
    required List<Order> orders,
    @JsonKey(name: 'order_items') required List<OrderItem> orderItems,
    @JsonKey(name: 'order_extras') required List<OrderExtra> orderExtras,
    @JsonKey(name: 'order_payments') required List<OrderPayment> orderPayments,
  }) = _SyncNewRecordData;

  factory SyncNewRecordData.fromJson(Map<String, dynamic> json) => _$SyncNewRecordDataFromJson(json);
}
