import 'package:flutter/material.dart';
import 'package:hop_pos/app/app_assets.dart';

class LogoLoading extends StatelessWidget {
  const LogoLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AppAssets.logo,
              fit: BoxFit.contain,
              width: 250,
            ),
            const SizedBox(height: 50),
            const CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
