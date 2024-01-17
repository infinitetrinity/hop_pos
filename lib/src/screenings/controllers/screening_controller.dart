import 'package:hop_pos/src/screening_timeslots/models/screening_timeslot_with_venue.dart';
import 'package:hop_pos/src/screening_timeslots/repositories/screening_timeslot_repository.dart';
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

  void selectScreening(Screening screening) {
    if (state.asData?.value.contains(screening) == false) {
      state = AsyncValue.data([screening, ...(state.asData?.value ?? [])]);
    }

    ref.read(selectedScreeningStateProvider.notifier).set(screening);
  }

  Future<List<ScreeningTimeslotWithVenue>> getTimeslotsWithVenue(Screening screening, {int page = 1, int size = 20}) async {
    ScreeningTimeslotRepository repo = ref.watch(screeningTimeslotRepoProvider);
    return await repo.getScreeningTimeslotsWithVenue(screening, page: page, size: size);
  }

  Future<int> getTimeslotsCount(Screening screening) async {
    ScreeningTimeslotRepository repo = ref.watch(screeningTimeslotRepoProvider);
    return await repo.getScreeningTimeslotsCount(screening);
  }
}
