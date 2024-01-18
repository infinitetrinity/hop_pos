import 'package:flutter/material.dart';

class PaginatorNav extends StatelessWidget {
  const PaginatorNav({super.key, required this.currentPage, required this.totalPages, required this.onPageChanged});
  final int currentPage;
  final int totalPages;
  final Function(int) onPageChanged;

  @override
  Widget build(BuildContext context) {
    const int displayPages = 5;
    int startPage = (currentPage - 2).clamp(1, currentPage + 2);
    int endPage = (currentPage + 2).clamp(totalPages < displayPages ? totalPages : displayPages, totalPages);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (totalPages > 5)
          IconButton(
            onPressed: () => onPageChanged(1),
            icon: const Icon(Icons.first_page),
          ),
        IconButton(
          onPressed: () => onPageChanged(currentPage - 1),
          icon: const Icon(Icons.navigate_before),
        ),
        for (int i = startPage; i <= endPage; i++)
          IconButton(
            onPressed: () => onPageChanged(i),
            icon: Text(
              i.toString(),
              style: TextStyle(
                fontWeight: i == currentPage ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ),
        IconButton(
          onPressed: () => onPageChanged(currentPage + 1),
          icon: const Icon(Icons.navigate_next),
        ),
        if (totalPages > 5)
          IconButton(
            onPressed: () => onPageChanged(totalPages),
            icon: const Icon(Icons.last_page),
          ),
      ],
    );
  }
}
