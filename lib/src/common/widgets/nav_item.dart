import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hop_pos/app/app_colors.dart';
import 'package:hop_pos/app/app_routes.dart';
import 'package:hop_pos/app/app_styles.dart';

class NavItem extends ConsumerWidget {
  const NavItem({super.key, required this.icon, required this.title, required this.path, this.samePaths});
  final IconData icon;
  final String title;
  final String path;
  final List<String>? samePaths;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentPath = ref.watch(goRouterProvider).routeInformationProvider.value.uri.path;
    final isSelected = currentPath == path || samePaths?.contains(currentPath) == true;

    return GestureDetector(
      onTap: () {
        context.push(path);
      },
      child: Container(
        height: 66,
        decoration: BoxDecoration(
          border: Border(
            top: const BorderSide(width: 4, color: Colors.transparent),
            bottom: BorderSide(width: 4, color: isSelected ? AppColors.white : Colors.transparent),
          ),
        ),
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                title,
                style: AppStyles.body.copyWith(
                  color: isSelected ? AppColors.white : AppColors.gray100,
                  fontSize: 17,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
