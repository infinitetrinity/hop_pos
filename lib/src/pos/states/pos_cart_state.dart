import 'package:hop_pos/src/pos/models/pos_cart.dart';
import 'package:hop_pos/src/screenings/models/screening.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'pos_cart_state.g.dart';

@riverpod
class PosCartState extends _$PosCartState {
  @override
  PosCart build() {
    return const PosCart();
  }

  void setScreening(Screening screening) {
    state = state.copyWith(screening: screening);
  }
}
