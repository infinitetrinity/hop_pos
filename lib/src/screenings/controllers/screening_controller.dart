import 'package:hop_pos/src/screening_timeslots/models/screening_timeslot_with_venue.dart';
import 'package:hop_pos/src/screenings/actions/screening_actions.dart';
import 'package:hop_pos/src/screenings/models/screening.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'screening_controller.g.dart';

@riverpod
class ScreeningController extends _$ScreeningController {
  @override
  Future<List<List<Screening>>> build() {
    return ref
        .watch(screeningActionsProvider.notifier)
        .getUpcomingScreenings(
          partitionSize: 20,
        )
        .then((dynamic result) {
      return result as List<List<Screening>>;
    });
  }

  void selectScreening(Screening screening) {
    final screenings =
        ref.read(screeningActionsProvider.notifier).addToScreenings(state.asData?.value ?? [], screening);

    if (screenings != null) {
      state = AsyncValue.data(screenings);
    }
  }

  Future<List<ScreeningTimeslotWithVenue>> getTimeslotsWithVenue(
    Screening screening, {
    int page = 1,
    int size = 20,
  }) async {
    return await ref.read(screeningActionsProvider.notifier).getTimeslotsWithVenue(
          screening,
          page: page,
          size: size,
        );
  }

  Future<int> getTimeslotsCount(Screening screening) async {
    return await ref.read(screeningActionsProvider.notifier).getTimeslotsCount(screening);
  }

  Future<List<Screening>> search(String search) async {
    return await ref.read(screeningActionsProvider.notifier).search(search);
  }
}
