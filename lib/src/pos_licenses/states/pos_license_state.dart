import 'package:hop_pos/src/pos_licenses/models/pos_license.dart';
import 'package:hop_pos/src/pos_licenses/repositories/pos_license_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'pos_license_state.g.dart';

@riverpod
Future<PosLicense?> posLicenseState(PosLicenseStateRef ref) async {
  final repo = ref.watch(posLicenseRepoProvider);
  return await repo.getFirst();
}
