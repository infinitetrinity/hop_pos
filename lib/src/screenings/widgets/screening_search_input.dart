import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hop_pos/app/app_styles.dart';
import 'package:hop_pos/src/screenings/controllers/screening_controller.dart';
import 'package:hop_pos/src/screenings/models/screening.dart';
import 'package:hop_pos/src/screenings/states/screenings_search_state.dart';
import 'package:hop_pos/src/screenings/widgets/screening_search_list.dart';
import 'package:hop_pos/src/screenings/widgets/screening_search_text_input.dart';
import 'package:hop_pos/src/screenings/widgets/screening_tile.dart';

class ScreeningSearchInput extends HookConsumerWidget {
  const ScreeningSearchInput({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TypeAheadField<Screening>(
      suggestionsCallback: (search) => ref.read(screeningsSearchStateProvider(search).future),
      builder: (context, controller, focusNode) => ScreeningSearchTextInput(controller: controller, focusNode: focusNode),
      listBuilder: (context, children) => ScreeningSearchList(children),
      itemBuilder: (context, screening) => ScreeningTile(screening),
      emptyBuilder: (context) => Container(
        padding: const EdgeInsets.all(12),
        child: Text(
          'No screening found',
          style: AppStyles.body.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
      onSelected: (screening) async {
        await ref.read(screeningControllerProvider.notifier).selectScreening(screening);
      },
    );
  }
}
