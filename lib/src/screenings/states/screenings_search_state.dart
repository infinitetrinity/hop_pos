import 'package:hop_pos/src/screenings/models/screening.dart';
import 'package:hop_pos/src/screenings/repositories/screening_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'screenings_search_state.g.dart';

@riverpod
Future<List<Screening>> screeningsSearchState(ScreeningsSearchStateRef ref, String search) {
  final repo = ref.watch(screeningRepoProvider);
  return repo.search(search);
}
