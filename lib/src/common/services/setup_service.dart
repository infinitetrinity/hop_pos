import 'package:hop_pos/app/app_db.dart';
import 'package:hop_pos/src/common/services/auth_token.dart';
import 'package:hop_pos/src/company/states/company_state.dart';
import 'package:hop_pos/src/pos_licenses/states/pos_license_state.dart';
import 'package:hop_pos/src/receipt_settings/states/receipt_setting_state.dart';
import 'package:hop_pos/src/users/states/auth_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'setup_service.g.dart';

@Riverpod(keepAlive: true)
class SetupService extends _$SetupService {
  @override
  Future<void> build() async {
    ref.onDispose(() {
      ref.invalidate(companyStateProvider);
      ref.invalidate(posLicenseStateProvider);
      ref.invalidate(receiptSettingStateProvider);
    });

    await ref.watch(companyStateProvider.future);
    await ref.watch(posLicenseStateProvider.future);
    await ref.watch(receiptSettingStateProvider.future);
  }

  Future<void> resetApp() async {
    print('reset app');
    await AuthToken.deleteAuthToken();
    await ref.read(authStateProvider.notifier).reset();
    await ref.read(appDbProvider).deleteDb();
  }
}
