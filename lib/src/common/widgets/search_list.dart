import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hop_pos/app/app_colors.dart';

class SearchList extends ConsumerWidget {
  const SearchList(this.children, {super.key});
  final List<Widget> children;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      constraints: const BoxConstraints(maxHeight: 400),
      child: ListView.separated(
        shrinkWrap: true,
        physics: const AlwaysScrollableScrollPhysics(),
        itemCount: children.length,
        itemBuilder: (BuildContext ctx, int index) {
          return children[index];
        },
        separatorBuilder: (context, index) {
          return const Divider(
            height: 1,
            color: AppColors.gray300,
          );
        },
      ),
    );
  }
}
