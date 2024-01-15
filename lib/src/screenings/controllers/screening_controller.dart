import 'package:hop_pos/src/screenings/models/screening.dart';
import 'package:hop_pos/src/screenings/repositories/screening_repository.dart';
import 'package:hop_pos/src/screenings/states/selected_screening_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'screening_controller.g.dart';

@riverpod
class ScreeningController extends _$ScreeningController {
  @override
  Future<List<Screening>> build() {
    return _getUpcomingScreenings();
  }

  Future<List<Screening>> _getUpcomingScreenings() {
    ScreeningRepository repo = ref.watch(screeningRepoProvider);
    return repo.getUpcoming();
  }

  Future<void> selectScreening(Screening screening) async {
    ScreeningRepository repo = ref.watch(screeningRepoProvider);
    final selected = await repo.getWithVenuesAndTimeslots(screening);

    if (state.asData?.value.contains(screening) == false) {
      state = AsyncValue.data([screening, ...(state.asData?.value ?? [])]);
    }

    ref.read(selectedScreeningStateProvider.notifier).set(selected);
  }
}
