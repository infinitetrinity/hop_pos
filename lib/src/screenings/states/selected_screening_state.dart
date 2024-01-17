import 'package:hop_pos/src/screenings/models/screening.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'selected_screening_state.g.dart';

@riverpod
class SelectedScreeningState extends _$SelectedScreeningState {
  @override
  Screening? build() {
    return null;
  }

  void set(Screening screening) {
    state = screening;
  }
}
