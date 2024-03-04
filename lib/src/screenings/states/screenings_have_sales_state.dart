import 'package:hop_pos/src/screenings/actions/screening_actions.dart';
import 'package:hop_pos/src/screenings/models/screening.dart';
import 'package:hop_pos/src/screenings/models/screening_with_sales_data.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'screenings_have_sales_state.g.dart';

@riverpod
Future<List<ScreeningWithSalesData>> screeningsHaveSalesWithinDays(ScreeningsHaveSalesWithinDaysRef ref) async {
  return await ref.watch(screeningActionsProvider).getHaveSalesWithinDays();
}
