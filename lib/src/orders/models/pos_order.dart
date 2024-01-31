import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hop_pos/src/order_extras/models/order_extra.dart';
import 'package:hop_pos/src/order_items/models/order_item.dart';
import 'package:hop_pos/src/order_payments/models/order_payment.dart';
import 'package:hop_pos/src/orders/models/order.dart';

part 'pos_order.freezed.dart';
part 'pos_order.g.dart';

@freezed
class PosOrder with _$PosOrder {
  const factory PosOrder({
    required Order order,
    List<OrderItem>? items,
    List<OrderExtra>? extras,
    List<OrderPayment>? payments,
  }) = _Order;

  factory PosOrder.fromJson(Map<String, dynamic> json) => _$PosOrderFromJson(json);
}
