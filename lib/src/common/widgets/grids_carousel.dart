import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hop_pos/src/common/widgets/arrows_nav.dart';

class GridsCarousel extends HookConsumerWidget {
  const GridsCarousel({
    super.key,
    required this.controller,
    required this.items,
    required this.itemBuilder,
  });
  final CarouselController controller;
  final List<List<dynamic>> items;
  final Widget? Function(dynamic) itemBuilder;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentPage = useState(0);

    return items.isNotEmpty
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
                items: items.map((items) {
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
                      itemBuilder: (context, index) => itemBuilder(items[index]),
                    ),
                  );
                }).toList(),
              ),
              if (items.length > 1)
                ArrowsNav(
                  onPrevPressed: currentPage.value == 0 ? null : () => controller.previousPage(),
                  onNextPressed: currentPage.value == items.length - 1 ? null : () => controller.nextPage(),
                ),
            ],
          )
        : const SizedBox();
  }
}
