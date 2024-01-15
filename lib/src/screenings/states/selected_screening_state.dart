import 'package:hop_pos/src/screenings/models/screening_with_venues_and_timeslots.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'selected_screening_state.g.dart';

@riverpod
class SelectedScreeningState extends _$SelectedScreeningState {
  @override
  ScreeningWithVenuesAndTimeslots? build() {
    return null;
  }

  void set(ScreeningWithVenuesAndTimeslots screening) {
    state = screening;
  }
}
