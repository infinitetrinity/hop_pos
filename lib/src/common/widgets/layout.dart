import 'package:flutter/material.dart';
import 'package:hop_pos/app/app_colors.dart';
import 'package:hop_pos/src/common/widgets/header.dart';

class Layout extends StatelessWidget {
  const Layout(this.content, {super.key});
  final Widget content;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: AppColors.gray200,
        child: Column(
          children: [
            const Header(),
            Container(
              width: double.infinity,
              constraints: const BoxConstraints(maxWidth: 1280),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 25),
              child: content,
            ),
          ],
        ),
      ),
    );
  }
}
