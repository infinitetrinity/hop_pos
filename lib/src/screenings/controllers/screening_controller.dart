import 'package:hop_pos/src/screenings/models/screening.dart';
import 'package:hop_pos/src/screenings/repositories/screening_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'screening_controller.g.dart';

@riverpod
class ScreeningController extends _$ScreeningController {
  @override
  Stream<List<Screening>> build() {
    return _getUpcomingScreenings();
  }

  Stream<List<Screening>> _getUpcomingScreenings() {
    ScreeningRepository repo = ref.watch(screeningRepoProvider);
    return repo.getUpcoming();
  }
}
