import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hop_pos/app/app_colors.dart';
import 'package:hop_pos/app/app_styles.dart';
import 'package:hop_pos/src/common/widgets/form_search_input.dart';
import 'package:hop_pos/src/common/widgets/search_list.dart';
import 'package:hop_pos/src/pos/controllers/pos_controller.dart';
import 'package:hop_pos/src/screenings/controllers/screening_controller.dart';
import 'package:hop_pos/src/screenings/models/screening.dart';
import 'package:hop_pos/src/screenings/widgets/screening_tile.dart';

class ScreeningSearchInput extends HookConsumerWidget {
  const ScreeningSearchInput({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TypeAheadField<Screening>(
      suggestionsCallback: (search) => ref.read(screeningControllerProvider.notifier).search(search),
      builder: (context, controller, focusNode) => FormSearchTextInput(
        controller: controller,
        focusNode: focusNode,
        label: 'Search Screening',
      ),
      listBuilder: (context, children) => SearchList(children),
      itemBuilder: (context, screening) => ScreeningTile(screening),
      emptyBuilder: (context) => Container(
        padding: const EdgeInsets.all(12),
        color: AppColors.white,
        width: double.infinity,
        child: Text(
          'No screening found',
          style: AppStyles.body,
        ),
      ),
      onSelected: (screening) {
        ref.read(screeningControllerProvider.notifier).selectScreening(screening);
        ref.read(posControllerProvider.notifier).setScreening(screening);
      },
    );
  }
}
