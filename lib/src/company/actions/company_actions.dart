import 'package:hop_pos/src/company/models/company.dart';
import 'package:hop_pos/src/company/repositories/company_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'company_actions.g.dart';

@riverpod
CompanyActions companyActions(CompanyActionsRef ref) {
  return CompanyActions(
    companyRepo: ref.watch(companyRepoProvider),
  );
}

class CompanyActions {
  final CompanyRepository companyRepo;

  CompanyActions({
    required this.companyRepo,
  });

  Future<Company?> getFirst() async {
    return await companyRepo.getFirst();
  }
}
