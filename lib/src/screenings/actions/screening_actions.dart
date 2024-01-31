import 'package:hop_pos/src/screening_timeslots/models/screening_timeslot_with_venue.dart';
import 'package:hop_pos/src/screening_timeslots/repositories/screening_timeslot_repository.dart';
import 'package:hop_pos/src/screenings/models/screening.dart';
import 'package:hop_pos/src/screenings/repositories/screening_repository.dart';
import 'package:quiver/iterables.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'screening_actions.g.dart';

@riverpod
class ScreeningActions extends _$ScreeningActions {
  @override
  void build() {
    return;
  }

  Future<dynamic> getUpcomingScreenings({int partitionSize = 0}) async {
    ScreeningRepository repo = ref.watch(screeningRepoProvider);
    final screenings = await repo.getUpcoming();

    return partitionSize > 0 ? partition<Screening>(screenings, partitionSize).toList() : screenings;
  }

  List<List<Screening>>? addToScreenings(List<List<Screening>> screenings, Screening screening) {
    bool screeningExists = screenings.any((child) => child.contains(screening));

    if (screeningExists) {
      return null;
    }

    screenings.insert(0, [screening]);
    return partition<Screening>(screenings.expand((child) => child), 20).toList();
  }

  Future<List<ScreeningTimeslotWithVenue>> getTimeslotsWithVenue(
    Screening screening, {
    int page = 1,
    int size = 20,
  }) async {
    final repo = ref.watch(screeningTimeslotRepoProvider);
    return await repo.getScreeningTimeslotsWithVenue(screening, page: page, size: size);
  }

  Future<int> getTimeslotsCount(Screening screening) async {
    final repo = ref.watch(screeningTimeslotRepoProvider);
    return await repo.getScreeningTimeslotsCount(screening);
  }

  Future<List<Screening>> search(String search) async {
    final repo = ref.watch(screeningRepoProvider);
    return await repo.search(search);
  }
}
