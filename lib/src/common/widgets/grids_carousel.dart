import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hop_pos/src/common/widgets/arrows_nav.dart';
import 'package:hop_pos/src/common/widgets/paginator_nav.dart';

class GridsCarousel extends HookConsumerWidget {
  const GridsCarousel({
    super.key,
    required this.controller,
    required this.items,
    required this.itemBuilder,
    this.height = 725,
    this.aspectRatio = 1.45,
    this.arrows = true,
  });
  final CarouselController controller;
  final List<List<dynamic>> items;
  final Widget? Function(dynamic) itemBuilder;
  final double height;
  final double aspectRatio;
  final bool arrows;

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
                  height: height,
                  enableInfiniteScroll: false,
                ),
                carouselController: controller,
                items: items.map((items) {
                  return Container(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        childAspectRatio: aspectRatio,
                      ),
                      itemCount: items.length,
                      itemBuilder: (context, index) => itemBuilder(items[index]),
                    ),
                  );
                }).toList(),
              ),
              if (items.length > 1)
                arrows
                    ? ArrowsNav(
                        onPrevPressed: currentPage.value == 0 ? null : () => controller.previousPage(),
                        onNextPressed: currentPage.value == items.length - 1 ? null : () => controller.nextPage(),
                      )
                    : PaginatorNav(
                        currentPage: currentPage.value + 1,
                        totalPages: items.length,
                        onPageChanged: (page) => controller.animateToPage(page - 1),
                      ),
            ],
          )
        : const SizedBox();
  }
}
