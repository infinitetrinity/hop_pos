import 'package:hop_pos/src/to_sync_data/models/to_sync_data.dart';
import 'package:hop_pos/src/to_sync_data/repositories/to_sync_data_repo.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'to_sync_data_action.g.dart';

@riverpod
ToSyncDataAction toSyncDataAction(ToSyncDataActionRef ref) {
  return ToSyncDataAction(
    toSyncDataRepo: ref.watch(toSyncDataRepoProvider),
  );
}

class ToSyncDataAction {
  final ToSyncDataRepository toSyncDataRepo;

  ToSyncDataAction({
    required this.toSyncDataRepo,
  });

  Future<List<ToSyncData>> getAllNew() async {
    return toSyncDataRepo.getAll();
  }
}
