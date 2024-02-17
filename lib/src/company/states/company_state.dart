import 'package:hop_pos/src/company/actions/company_actions.dart';
import 'package:hop_pos/src/company/models/company.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'company_state.g.dart';

@Riverpod(keepAlive: true)
Future<Company?> companyState(CompanyStateRef ref) async {
  return await ref.read(companyActionsProvider).getFirst();
}
