import 'package:hop_pos/src/pos_extras/models/pos_extra.dart';
import 'package:hop_pos/src/pos_extras/repositories/pos_extra_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'pos_extra_actions.g.dart';

@riverpod
PosExtraActions posExtraActions(PosExtraActionsRef ref) {
  return PosExtraActions(
    extraRepo: ref.watch(posExtraRepoProvider),
  );
}

class PosExtraActions {
  final PosExtraRepository extraRepo;

  PosExtraActions({
    required this.extraRepo,
  });

  Future<List<PosExtra>> getAllExtras() async {
    return await extraRepo.getAll();
  }
}
