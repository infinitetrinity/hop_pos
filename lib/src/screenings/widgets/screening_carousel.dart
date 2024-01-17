import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hop_pos/app/app_colors.dart';
import 'package:hop_pos/src/screenings/models/screening.dart';
import 'package:hop_pos/src/screenings/states/selected_screening_state.dart';
import 'package:hop_pos/src/screenings/widgets/screening_grid.dart';

class ScreeningCarousel extends StatefulHookConsumerWidget {
  const ScreeningCarousel({super.key, required this.screenings});
  final List<List<Screening>> screenings;

  @override
  ConsumerState<ScreeningCarousel> createState() => _ScreeningCarouselState();
}

class _ScreeningCarouselState extends ConsumerState<ScreeningCarousel> {
  final CarouselController controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    final currentPage = useState(0);

    ref.listen<Screening?>(selectedScreeningStateProvider, (_, Screening? current) {
      if (current == null) {
        return;
      }

      int index = widget.screenings.indexWhere((screeningList) => screeningList.indexWhere((screening) => screening == current) != -1);
      index = index == -1 ? 0 : index;

      if (currentPage.value != index) {
        controller.animateToPage(index);
      }
    });

    return widget.screenings.isNotEmpty
        ? Column(
            children: [
              CarouselSlider(
                options: CarouselOptions(
                  onPageChanged: (index, reason) {
                    currentPage.value = index;
                  },
                  viewportFraction: 1,
                  height: 725,
                  enableInfiniteScroll: false,
                ),
                carouselController: controller,
                items: widget.screenings.map((items) {
                  return Container(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        childAspectRatio: 1.45,
                      ),
                      itemCount: items.length,
                      itemBuilder: (context, index) => ScreeningGrid(
                        screening: items[index],
                      ),
                    ),
                  );
                }).toList(),
              ),
              if (widget.screenings.length > 1)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        disabledMouseCursor: SystemMouseCursors.forbidden,
                        backgroundColor: AppColors.white,
                        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
                      ),
                      onPressed: currentPage.value == 0 ? null : () => controller.previousPage(),
                      child: const Icon(
                        size: 18,
                        Icons.arrow_back,
                        color: AppColors.gray800,
                      ),
                    ),
                    const SizedBox(width: 15),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        disabledMouseCursor: SystemMouseCursors.forbidden,
                        backgroundColor: AppColors.white,
                        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
                      ),
                      onPressed: currentPage.value == widget.screenings.length - 1 ? null : () => controller.nextPage(),
                      child: const Icon(
                        size: 18,
                        Icons.arrow_forward,
                        color: AppColors.gray800,
                      ),
                    ),
                  ],
                ),
            ],
          )
        : const SizedBox();
  }
}
