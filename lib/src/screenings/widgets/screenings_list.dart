import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hop_pos/src/common/services/carousel_hook.dart';
import 'package:hop_pos/src/common/widgets/grids_carousel.dart';
import 'package:hop_pos/src/pos/states/pos_cart_state.dart';
import 'package:hop_pos/src/screenings/controllers/screening_controller.dart';
import 'package:hop_pos/src/screenings/models/screening.dart';
import 'package:hop_pos/src/screenings/widgets/screening_grid.dart';

class ScreeningsList extends HookConsumerWidget {
  const ScreeningsList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = useCarouselController();
    final screeningsAsync = ref.watch(screeningControllerProvider);

    ref.listen<Screening?>(posCartStateProvider.select((prov) => prov.screening), (_, Screening? current) {
      final screenings = screeningsAsync.asData?.value;
      if (current == null || screenings == null) {
        return;
      }

      int index = screenings.indexWhere((screeningList) => screeningList.contains(current));
      index = index == -1 ? 0 : index;
      controller.animateToPage(index);
    });

    return screeningsAsync.when(
      data: (screenings) => GridsCarousel(
        controller: controller,
        items: screenings,
        itemBuilder: (item) => ScreeningGrid(screening: item),
      ),
      error: (err, stack) {
        print(err);
        return Container(child: const Text('error'));
      },
      loading: () => Container(
        child: const Text('loading'),
      ),
    );
  }
}
