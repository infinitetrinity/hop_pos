import 'package:freezed_annotation/freezed_annotation.dart';

part 'syncing_progress.freezed.dart';
part 'syncing_progress.g.dart';

@freezed
class SyncingProgress with _$SyncingProgress {
  const SyncingProgress._();

  const factory SyncingProgress({
    required bool isSyncing,
    required int currentPage,
    required int lastPage,
  }) = _SyncingProgress;

  factory SyncingProgress.fromJson(Map<String, dynamic> json) => _$SyncingProgressFromJson(json);

  double get progress {
    return currentPage > 0 && lastPage > 0 ? currentPage / lastPage : 0;
  }
}
