import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hop_pos/src/screenings/controllers/screening_controller.dart';
import 'package:hop_pos/src/screenings/models/screening.dart';
import 'package:hop_pos/src/screenings/widgets/screening_carousel.dart';

class ScreeningsList extends ConsumerWidget {
  const ScreeningsList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screeningsAsync = ref.watch(screeningControllerProvider);

    List<List<Screening>> getChunkedScreenings(List<Screening> screenings) {
      List<List<Screening>> chunkedScreenings = [];
      for (var i = 0; i < screenings.length; i += 20) {
        chunkedScreenings.add(screenings.sublist(i, i + 20 > screenings.length ? screenings.length : i + 20));
      }

      return chunkedScreenings;
    }

    return screeningsAsync.when(
      data: (screenings) => ScreeningCarousel(screenings: getChunkedScreenings(screenings)),
      error: (err, stack) => Container(child: const Text('error')),
      loading: () => Container(
        child: const Text('loading'),
      ),
    );
  }
}
