import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hop_pos/app/app_colors.dart';
import 'package:hop_pos/app/app_styles.dart';
import 'package:hop_pos/src/common/widgets/text_input.dart';
import 'package:hop_pos/src/screening_venues/widgets/screening_venues_with_timeslots_detail.dart';
import 'package:hop_pos/src/screenings/states/selected_screening_state.dart';

class SelectedScreeningDetail extends ConsumerWidget {
  const SelectedScreeningDetail({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screening = ref.watch(selectedScreeningStateProvider);

    return screening == null
        ? Container(
            width: double.infinity,
            padding: const EdgeInsets.all(8),
            color: AppColors.gray200,
            child: Text(
              'No screening selected',
              style: AppStyles.body,
            ),
          )
        : Column(
            children: [
              TextInput(
                label: 'Screening Name',
                content: screening.screening.name,
              ),
              const SizedBox(height: 15),
              TextInput(
                label: 'Corporate',
                content: screening.screening.corporate ?? '',
              ),
              const SizedBox(height: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${screening.timeslotsCount} timeslots",
                    style: AppStyles.body.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  ScreeningVenusWithTimelotsDetail(venues: screening.venuesWithTimeslots),
                ],
              ),
            ],
          );
  }
}
