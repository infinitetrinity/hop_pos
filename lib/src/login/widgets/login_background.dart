import 'package:flutter/material.dart';
import 'package:hop_pos/app/app_colors.dart';

class LoginBackground extends StatelessWidget {
  const LoginBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 6,
      child: Container(
        decoration: const BoxDecoration(
          color: AppColors.gray100,
          image: DecorationImage(
            image: AssetImage("assets/images/login_bg.png"),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
