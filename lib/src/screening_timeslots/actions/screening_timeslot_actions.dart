import 'package:hop_pos/src/screening_timeslots/models/screening_timeslot.dart';
import 'package:hop_pos/src/screening_timeslots/repositories/screening_timeslot_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'screening_timeslot_actions.g.dart';

@riverpod
ScreeningTimeslotActions screeningTimeslotActions(ScreeningTimeslotActionsRef ref) {
  return ScreeningTimeslotActions(
    screeningTimeslotRepo: ref.watch(screeningTimeslotRepoProvider),
  );
}

class ScreeningTimeslotActions {
  final ScreeningTimeslotRepository screeningTimeslotRepo;

  ScreeningTimeslotActions({
    required this.screeningTimeslotRepo,
  });

  Future<ScreeningTimeslot?> getById(int id) async {
    return await screeningTimeslotRepo.getById(id);
  }
}
