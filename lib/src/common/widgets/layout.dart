import 'package:flutter/material.dart';
import 'package:hop_pos/app/app_colors.dart';
import 'package:hop_pos/src/common/widgets/auto_upgrader.dart';
import 'package:hop_pos/src/common/widgets/header.dart';

class Layout extends StatelessWidget {
  const Layout(this.content, {super.key});
  final Widget content;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: const AutoUpgrader(),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height,
          ),
          color: AppColors.gray200,
          child: Column(
            children: [
              const Header(),
              Container(
                constraints: const BoxConstraints(maxWidth: 1280),
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
                child: content,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
