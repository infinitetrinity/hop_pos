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
    @Default(false) bool? payLater,
    List<OrderItem>? items,
    List<OrderExtra>? extras,
    List<OrderPayment>? payments,
  }) = _Order;

  const PosOrder._();

  factory PosOrder.fromJson(Map<String, dynamic> json) => _$PosOrderFromJson(json);

  double get subtotal {
    final double result = (items ?? []).fold(0, (total, item) => total + (item.netPrice ?? 0));
    return result.toDecimalPlace(2);
  }

  double get cartDiscount {
    return order.toCalculateDiscount(subtotal);
  }

  double get subtotalAfterDiscount {
    return (subtotal - cartDiscount).toDecimalPlace(2);
  }

  double get extrasTotal {
    final double result = (extras ?? []).fold(0, (total, extra) {
      double amount = extra.toCalculateAmount(subtotalAfterDiscount);
      return extra.isAddType ? total + amount : total - amount;
    });

    return result.toDecimalPlace(2);
  }

  double get totalBeforeRounding {
    double total = subtotalAfterDiscount;

    if (total > 0) {
      total = total + extrasTotal;
    }

    return total.toDecimalPlace(2);
  }

  double get total {
    return totalBeforeRounding.roundDownTo5Cents();
  }

  double get rounding {
    return (totalBeforeRounding - total).toDecimalPlace(2);
  }

  double get totalPayment {
    final double result = (payments ?? []).fold(0, (total, payment) => total + (payment.amount ?? 0));
    return result.toDecimalPlace(2);
  }

  double get balance {
    final amount = (total - totalPayment).toDecimalPlace(2);
    return amount > 0 ? amount : 0;
  }

  double get balanceBeforeDiscount {
    return subtotal - totalPayment;
  }

  double get change {
    final amount = (total - totalPayment).toDecimalPlace(2);
    return amount > 0 ? 0 : amount.abs();
  }

  bool get isFullyPaid {
    return balance == 0 || payLater == true;
  }
}
