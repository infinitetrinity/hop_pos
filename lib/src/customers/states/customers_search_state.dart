import 'package:hop_pos/src/customers/models/customer_with_registration.dart';
import 'package:hop_pos/src/customers/repositories/customer_repository.dart';
import 'package:hop_pos/src/pos/controllers/pos_controller.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'customers_search_state.g.dart';

@riverpod
FutureOr<List<CustomerWithRegistration>> customersSearchState(CustomersSearchStateRef ref, String search) {
  final screening = ref.watch(posControllerProvider.select((prov) => prov.screening));
  if (screening != null) {
    final repo = ref.watch(customerRepoProvider);
    return repo.searchScreening(screening, search);
  }

  return [];
}
