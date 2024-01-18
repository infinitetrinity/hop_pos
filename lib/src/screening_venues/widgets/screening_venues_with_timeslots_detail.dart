import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hop_pos/app/app_colors.dart';
import 'package:hop_pos/app/app_extension.dart';
import 'package:hop_pos/src/common/services/paging_hook.dart';
import 'package:hop_pos/src/screening_timeslots/models/screening_timeslot_with_venue.dart';
import 'package:hop_pos/src/screenings/controllers/screening_controller.dart';
import 'package:hop_pos/src/screenings/states/selected_screening_state.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class ScreeningVenusWithTimelotsDetail extends HookConsumerWidget {
  const ScreeningVenusWithTimelotsDetail({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screening = ref.watch(selectedScreeningStateProvider);
    const pageSize = 20;
    final PagingController controller = usePagingController(firstPageKey: 0);
    final timeslotsCount = useState(0);

    getTimeslotsCount() async {
      timeslotsCount.value = await ref.read(screeningControllerProvider.notifier).getTimeslotsCount(screening!);
    }

    getTimeslots(pageKey) async {
      final timeslots = await ref.read(screeningControllerProvider.notifier).getTimeslotsWithVenue(screening!, page: pageKey + 1, size: pageSize);
      pageSize * pageKey < timeslotsCount.value ? controller.appendPage(timeslots, pageKey + 1) : controller.appendLastPage(timeslots);
    }

    useEffect(() {
      getTimeslotsCount();
      controller.addPageRequestListener(getTimeslots);

      return () {
        controller.removePageRequestListener(getTimeslots);
        controller.refresh();
      };
    }, [screening]);

    return Expanded(
      child: PagedListView(
        pagingController: controller,
        builderDelegate: PagedChildBuilderDelegate(
          itemBuilder: (context, item, index) {
            item as ScreeningTimeslotWithVenue;

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  color: AppColors.gray200,
                  padding: const EdgeInsets.all(8),
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SelectableText(item.venue.fullAddress ?? item.venue.name),
                      SelectableText(
                        item.timeslot.displayDateTime,
                        style: context.textTheme.bodyMedium?.copyWith(
                          color: AppColors.green600,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      SelectableText(item.timeslot.displaySlots),
                      if (item.timeslot.hasSpecimenCollection) ...[
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: Container(
                            width: double.infinity,
                            height: 1,
                            color: AppColors.gray400,
                          ),
                        ),
                        const SelectableText('Specimen Collection'),
                        if (!item.timeslot.specimenCollectionVenue.isNullOrEmpty) SelectableText('Venue: ${item.timeslot.specimenCollectionVenue}'),
                        if (item.timeslot.displaySpecimenCollectionDate != null) SelectableText('Date: ${item.timeslot.displaySpecimenCollectionDate}'),
                        if (!item.timeslot.specimenCollectionTime.isNullOrEmpty) SelectableText('Time: ${item.timeslot.specimenCollectionTime}'),
                      ],
                    ],
                  ),
                ),
                const SizedBox(height: 10),
              ],
            );
          },
        ),
      ),
    );
  }
}
