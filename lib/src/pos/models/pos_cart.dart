import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hop_pos/src/customers/models/customer_with_registration.dart';
import 'package:hop_pos/src/screenings/models/screening.dart';

part 'pos_cart.freezed.dart';
part 'pos_cart.g.dart';

@freezed
class PosCart with _$PosCart {
  const factory PosCart({
    Screening? screening,
    CustomerWithRegistration? customer,
  }) = _PosCart;

  factory PosCart.fromJson(Map<String, dynamic> json) => _$PosCartFromJson(json);
}
