import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hop_pos/app/app_extension.dart';
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

  const PosOrder._();

  factory PosOrder.fromJson(Map<String, dynamic> json) => _$PosOrderFromJson(json);

  double get subtotal {
    if (items == null || items!.isEmpty) {
      return 0.00;
    }

    final double result = items!.fold(0, (total, item) => total + (item.netPrice ?? 0));
    return result.toDecimalPlace(2);
  }

  double get cartDiscount {
    double discount = order.discount ?? 0.00;
    return order.isDiscountPercentage ? subtotal.percentageOf(discount) : discount;
  }

  double get extraTotal {
    if (extras == null || extras!.isEmpty) {
      return 0.00;
    }

    final double result = extras!.fold(0, (total, extra) {
      double amount = extra.amount ?? 0;

      if (extra.isPercentage) {
        amount = subtotal.percentageOf(amount);
      }

      return extra.isAddType ? total + amount : total - amount;
    });

    return result.toDecimalPlace(2);
  }

  double get totalBeforeRounding {
    double total = subtotal - cartDiscount;

    if (total > 0) {
      total = total + extraTotal;
    }

    return total.toDecimalPlace(2);
  }

  double get total {
    return totalBeforeRounding.roundDownTo5Cents();
  }

  double get rounding {
    return total - totalBeforeRounding;
  }
}
