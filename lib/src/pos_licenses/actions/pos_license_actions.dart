import 'package:hop_pos/src/pos_licenses/models/pos_license.dart';
import 'package:hop_pos/src/pos_licenses/repositories/pos_license_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'pos_license_actions.g.dart';

@riverpod
PosLicenseActions posLicenseActions(PosLicenseActionsRef ref) {
  return PosLicenseActions(
    posLicenseRepo: ref.watch(posLicenseRepoProvider),
  );
}

class PosLicenseActions {
  final PosLicenseRepository posLicenseRepo;

  PosLicenseActions({
    required this.posLicenseRepo,
  });

  Future<PosLicense?> getFirst() async {
    return await posLicenseRepo.getFirst();
  }
}
