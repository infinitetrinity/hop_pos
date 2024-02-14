import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hop_pos/app/app_extension.dart';
import 'package:hop_pos/src/orders/models/order.dart';

part 'order_discount_form.freezed.dart';
part 'order_discount_form.g.dart';

@freezed
class OrderDiscountForm with _$OrderDiscountForm {
  const factory OrderDiscountForm({
    double? discount,
    @JsonKey(name: 'discount_type') DiscountType? discountType,
  }) = _OrderDiscountForm;

  const OrderDiscountForm._();

  factory OrderDiscountForm.fromJson(Map<String, dynamic> json) => _$OrderDiscountFormFromJson(json);

  static OrderDiscountForm fromModel(Order order) {
    return OrderDiscountForm.fromJson(order.toJson());
  }

  bool get isPercentageDiscount {
    return discountType == DiscountType.percentage;
  }

  double toCalculateDiscount(double value) {
    return isPercentageDiscount ? value.percentageOf(discount ?? 0) : discount ?? 0;
  }

  String? validateDiscount(double payable) {
    if (discount == null || discount == 0) {
      return null;
    }

    if (discount! < 0) {
      return "Discount must be a positive value.";
    }

    if (isPercentageDiscount && discount! > 100) {
      return "Discount must be equal to or lower than 100%.";
    }

    if (payable <= 0) {
      return "Cannot apply discount with \$0.00 payable.";
    }

    if (isPercentageDiscount && toCalculateDiscount(payable) > payable) {
      return "Discount must be equal to or lower than total payable before discount (${payable.formatMoney}).";
    }

    if (!isPercentageDiscount && discount! > payable) {
      return "Discount must be equal to or lower than total payable before discount (${payable.formatMoney}).";
    }

    return null;
  }
}
