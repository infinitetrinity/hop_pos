import 'package:hop_pos/src/receipt_settings/models/receipt_setting.dart';
import 'package:hop_pos/src/receipt_settings/repositories/receipt_setting_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'receipt_setting_actions.g.dart';

@riverpod
ReceiptSettingActions receiptSettingActions(ReceiptSettingActionsRef ref) {
  return ReceiptSettingActions(
    receiptSettingRepo: ref.watch(receiptSettingRepoProvider),
  );
}

class ReceiptSettingActions {
  final ReceiptSettingRepository receiptSettingRepo;

  ReceiptSettingActions({
    required this.receiptSettingRepo,
  });

  Future<ReceiptSetting?> getFirst() async {
    return await receiptSettingRepo.getFirst();
  }
}
