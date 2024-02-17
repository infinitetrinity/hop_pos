import 'package:hop_pos/src/receipt_settings/actions/receipt_setting_actions.dart';
import 'package:hop_pos/src/receipt_settings/models/receipt_setting.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'receipt_setting_state.g.dart';

@Riverpod(keepAlive: true)
Future<ReceiptSetting?> receiptSettingState(ReceiptSettingStateRef ref) async {
  return await ref.read(receiptSettingActionsProvider).getFirst();
}
