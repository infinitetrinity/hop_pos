import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hop_pos/app/app_colors.dart';
import 'package:hop_pos/app/app_styles.dart';
import 'package:hop_pos/src/common/widgets/text_input.dart';
import 'package:hop_pos/src/pos/controllers/pos_controller.dart';
import 'package:hop_pos/src/screening_venues/widgets/screening_venues_with_timeslots_detail.dart';
import 'package:hop_pos/src/screenings/controllers/screening_controller.dart';

class SelectedScreeningDetail extends HookConsumerWidget {
  const SelectedScreeningDetail({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screening = ref.watch(posControllerProvider.select((prov) => prov.screening));
    final timeslotsCount = useState<int?>(null);

    getTimeslotsCount() async {
      if (screening != null) {
        timeslotsCount.value = await ref.read(screeningControllerProvider.notifier).getTimeslotsCount(screening);
      }
    }

    useEffect(() {
      getTimeslotsCount();

      return null;
    }, [screening]);

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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextInput(
                label: 'Screening Name',
                content: screening.name,
              ),
              const SizedBox(height: 15),
              TextInput(
                label: 'Corporate',
                content: screening.corporate ?? '',
              ),
              const SizedBox(height: 15),
              if (timeslotsCount.value != null) ...[
                Text(
                  "${timeslotsCount.value} timeslots",
                  style: AppStyles.body.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 5),
              ],
              const ScreeningVenusWithTimelotsDetail(),
            ],
          );
  }
}
