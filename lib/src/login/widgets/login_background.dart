import 'package:flutter/material.dart';
import 'package:hop_pos/app/app_assets.dart';

class LoginBackground extends StatelessWidget {
  const LoginBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 6,
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppAssets.loginBg),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
