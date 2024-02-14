import 'package:hop_pos/src/pos_licenses/actions/pos_license_actions.dart';
import 'package:hop_pos/src/pos_licenses/models/pos_license.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'pos_license_state.g.dart';

@riverpod
Future<PosLicense?> posLicenseState(PosLicenseStateRef ref) async {
  return await ref.watch(posLicenseActionsProvider).getFirst();
}
